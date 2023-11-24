enum PhaseEnum {
  trung,
  antoan,
  thai,
  sua,
  vithanhnien,
}

PhaseEnum getPhase(int phase) {
  switch (phase) {
    case 1:
      return PhaseEnum.trung;
    case 2:
      return PhaseEnum.antoan;
    case 3:
      return PhaseEnum.thai;
    case 4:
      return PhaseEnum.sua;
    case 5:
      return PhaseEnum.vithanhnien;
    default:
      return PhaseEnum.trung;
  }
}
