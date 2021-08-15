class WuhanVirus {
  final List virusData;
  WuhanVirus({required this.virusData});
  factory WuhanVirus.fromJson(Map<String, dynamic> caseData) {
    return WuhanVirus(
      virusData: caseData[1],
    );
  }
}
