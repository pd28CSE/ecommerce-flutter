import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/review_controller.dart';
import './create_review_screen.dart';

class ReviewScreen extends StatefulWidget {
  final int productId;
  const ReviewScreen({super.key, required this.productId});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log(widget.productId.toString());
      Get.find<ReviewController>().getReviews(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: const BackButton(
          color: Colors.black54,
        ),
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<ReviewController>().getReviews(widget.productId);
        },
        child: GetBuilder<ReviewController>(
          builder: (reviewController) {
            if (reviewController.getReviewIsInProgress) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (reviewController.reviewModel.data?.isEmpty ?? true) {
              return Center(
                child: Text(
                  'No reviews.',
                  style: theme.textTheme.displaySmall?.copyWith(fontSize: 20),
                ),
              );
            }
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    itemCount: reviewController.reviewModel.data?.length ?? 0,
                    separatorBuilder: (cntxt, index) => const Divider(),
                    itemBuilder: (cntxt, index) {
                      return review(
                        "${reviewController.reviewModel.data?[index].profile?.firstName ?? 'Unknown'} ${reviewController.reviewModel.data?[index].profile?.lastName ?? ''}",
                        "${reviewController.reviewModel.data?[index].description}",
                      );
                    },
                  ),
                ),
                Ink(
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Reviews (${reviewController.reviewModel.data?.length ?? 0})',
                      ),
                      FloatingActionButton(
                        backgroundColor: theme.primaryColor,
                        onPressed: () {
                          Get.to(() => const CreateReviewScreen());
                        },
                        child: const Icon(Icons.add),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  ListTile review(String name, String review) {
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.person),
          const SizedBox(width: 10),
          Text(name),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(review),
      ),
      subtitleTextStyle: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}
