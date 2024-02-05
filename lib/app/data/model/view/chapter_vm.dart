/// 章节视图模型
class ChapterVm {
  // 章节ID
  int id;
  // 章节名称
  String name;
  // 章节描述
  String description;
  // 章节背景
  String backgroundUrl;
  // 章节起始节点
  Node node;
  // 章节是否解锁
  bool locked;
  // 章节进度
  int progress;

  ChapterVm({
    required this.id,
    required this.name,
    required this.description,
    required this.backgroundUrl,
    required this.node,
    required this.locked,
    required this.progress,
  });
}

abstract class Node {
  int id;
  NodeType type;
  List<Node>? childrenNodes;
  String videoUri;
  bool locked;

  Node({
    required this.id,
    required this.type,
    required this.videoUri,
    required this.childrenNodes,
    this.locked = false,
  });
}

enum NodeType {
  normal,
  descisionPoint,
}

/// 常规节点
class NormalNode extends Node {
  NormalNode({
    required super.id,
    required super.type,
    required super.videoUri,
    required super.childrenNodes,
  });
}

/// 决策节点
class DescisionNode extends Node {
  // 交互类型
  String interactionType;
  // 交互选项
  List<String> interactionOptions;
  // 交互时长
  int interactionDuration;

  DescisionNode({
    required super.id,
    required super.type,
    required super.videoUri,
    required super.childrenNodes,
    required this.interactionType,
    required this.interactionOptions,
    required this.interactionDuration,
  });
}
