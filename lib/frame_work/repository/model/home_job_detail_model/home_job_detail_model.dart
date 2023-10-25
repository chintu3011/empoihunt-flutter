class HomeJobDetailModel {
  String jobTitle;
  double lpa;
  double year;
  String degree;
  String companyName;
  int vacancy;
  String hrName;
  String location;
  String description;
  int days;

  HomeJobDetailModel(
      {required this.jobTitle,
      required this.lpa,
      required this.year,
      required this.degree,
      required this.companyName,
      required this.vacancy,
      required this.hrName,
      required this.location,
      required this.description,
      required this.days});
}
