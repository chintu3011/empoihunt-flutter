class CampusJobDetailModel{

  final String companyName;
  final String? address;
  final String date;
  final List<CampusDetailTableModel> tableData;
  final List<String> qualification;

  CampusJobDetailModel({required this.companyName,this.address, required this.date, required this.tableData,required this.qualification});
}



class CampusDetailTableModel{
 final String jobRole;
  final int vacancy;

  CampusDetailTableModel({required this.jobRole,required this.vacancy});
}