import 'package:web_app/app_colors.dart';

class ImageData {
  final String id;
  final String imageUrl;
  final String content;
  final String projectTitle;
  final List<String> relatedImages;
  const ImageData(
      {required this.id,
      required this.imageUrl,
      required this.content,
      required this.projectTitle,
      required this.relatedImages});
}

const imageList = [
  ImageData(
      id: 'id-001',
      relatedImages: [
        'https://picsum.photos/seed/image001/500/500',
        'https://picsum.photos/seed/image005/500/600',
        'https://picsum.photos/seed/image003/500/300',
        'https://picsum.photos/seed/image006/500/500',
      ],
      projectTitle: "Project Title",
      imageUrl: 'https://picsum.photos/seed/image001/500/500',
      content: TextConstants.textLong),
  ImageData(
      id: 'id-003',
      projectTitle: "Project Title",
      relatedImages: [
        'https://picsum.photos/seed/image003/500/300',
        'https://picsum.photos/seed/image005/500/600',
        'https://picsum.photos/seed/image017/500/600',
        'https://picsum.photos/seed/image006/500/500',
      ],
      imageUrl: 'https://picsum.photos/seed/image003/500/300',
      content: TextConstants.textLong),
  // ImageData(
  //     id: 'id-005',
  //     projectTitle: "Project Title",
  //     relatedImages: [
  //       'https://picsum.photos/seed/image005/500/600',
  //       'https://picsum.photos/seed/image003/500/300',
  //       'https://picsum.photos/seed/image017/500/600',
  //       'https://picsum.photos/seed/image006/500/500',
  //     ],
  //     imageUrl: 'https://picsum.photos/seed/image005/500/600',
  //     content: TextConstants.textLong),
  // ImageData(
  //     id: 'id-006',
  //     projectTitle: "Project Title",
  //     relatedImages: [
  //       'https://picsum.photos/seed/image006/500/500',
  //       'https://picsum.photos/seed/image003/500/300',
  //       'https://picsum.photos/seed/image017/500/600',
  //       'https://picsum.photos/seed/image007/500/400',
  //     ],
  //     imageUrl: 'https://picsum.photos/seed/image006/500/500',
  //     content: TextConstants.textLong),
  // ImageData(
  //     id: 'id-007',
  //     projectTitle: "Project Title",
  //     relatedImages: [
  //       'https://picsum.photos/seed/image007/500/400',
  //       'https://picsum.photos/seed/image003/500/300',
  //       'https://picsum.photos/seed/image017/500/600',
  //       'https://picsum.photos/seed/image006/500/500',
  //     ],
  //     imageUrl: 'https://picsum.photos/seed/image007/500/400',
  //     content: TextConstants.textLong),
  // ImageData(
  //     id: 'id-009',
  //     projectTitle: "Project Title",
  //     relatedImages: [
  //       'https://picsum.photos/seed/image009/500/600',
  //       'https://picsum.photos/seed/image003/500/300',
  //       'https://picsum.photos/seed/image017/500/600',
  //       'https://picsum.photos/seed/image006/500/500',
  //     ],
  //     imageUrl: 'https://picsum.photos/seed/image009/500/600',
  //     content: TextConstants.textLong),
  // ImageData(
  //     id: 'id-015',
  //     projectTitle: "Project Title",
  //     relatedImages: [
  //       'https://picsum.photos/seed/image015/500/500',
  //       'https://picsum.photos/seed/image003/500/300',
  //       'https://picsum.photos/seed/image017/500/600',
  //       'https://picsum.photos/seed/image006/500/500',
  //     ],
  //     imageUrl: 'https://picsum.photos/seed/image015/500/500',
  //     content: TextConstants.textLong),
  // ImageData(
  //     id: 'id-017',
  //     projectTitle: "Project Title",
  //     relatedImages: [
  //       'https://picsum.photos/seed/image017/500/600',
  //       'https://picsum.photos/seed/image003/500/300',
  //       'https://picsum.photos/seed/image015/500/500',
  //       'https://picsum.photos/seed/image006/500/500',
  //     ],
  //     imageUrl: 'https://picsum.photos/seed/image017/500/600',
  //     content: TextConstants.textLong),
];
