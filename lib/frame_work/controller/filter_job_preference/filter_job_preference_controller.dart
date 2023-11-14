import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final filterJobPreferenceController = ChangeNotifierProvider((ref) => FilterJobPreferenceController());

class FilterJobPreferenceController extends ChangeNotifier{
  
  late TabController tabController;


  List<String> modeList=["Hybrid","Remote","On-site"];
  int selectedFilterModeIndex = -1;
  void addModeToList({required int index,required bool selected,required String value}){
    if(selected && index != selectedFilterModeIndex){
      selectedValue[2].value = value;
      selectedFilterModeIndex = index;
    }else if(!selected && index == selectedFilterModeIndex){
      selectedValue[2].value = "";
      selectedFilterModeIndex = -1;
    }
    notifyListeners();
  }



  List<int> packageList = List.generate(25, (index) => index +1);
  int selectedFilterPackageIndex = -1;
  void addPackageToList({required int index,required bool selected,required String value}){
    if(selected && index != selectedFilterPackageIndex){
      selectedValue[3].value = value;
      selectedFilterPackageIndex = index;
    }else if(!selected && index == selectedFilterPackageIndex){
      selectedValue[3].value = "";
      selectedFilterPackageIndex = -1;
    }
    notifyListeners();
  }


  int selectedFilterDomainIndex = -1;
  void addDomainToList({required int index,required bool selected,required String value,}){
    if(selected && index != selectedFilterDomainIndex){
      selectedValue[0].value = value;
      selectedFilterDomainIndex = index;
      // print("$index,$value");
    }else if(!selected && index == selectedFilterDomainIndex){
      selectedValue[0].value="";
      selectedFilterDomainIndex = -1;
    }
    notifyListeners();
  }

  List<FilterValueAndMode> selectedValue = [
    FilterValueAndMode(mode: FilterMode.domain, value: ""),
    FilterValueAndMode(mode: FilterMode.location, value: ""),
    FilterValueAndMode(mode: FilterMode.mode, value: ""),
    FilterValueAndMode(mode: FilterMode.package, value: ""),
  ];
  void addFilters(){


  }

  List<String> domainList = [
    "Manager", "Director","CEO (Chief Executive Officer)", "CFO (Chief Financial Officer)", "CTO (Chief Technology Officer)","COO (Chief Operating Officer)",
    "President", "Vice President",    "General Manager",    "Assistant Manager",    "Assistant Manager",   "Intern/CA",    "Charted Accountant (CA)",
    "Accountant",
    "CA Foundation",
    "Associate",
    "Consultant",
    "Engineer",
    "Architect",
    "Analyst",
    "Designer",
    "Developer",
    "Coordinator",
    "Supervisor",
    "Executive",
    "Project Manager",
    "HR Manager",
    "Marketing Manager",
    "Sales Manager",
    "Researcher",
    "Content Writer",
    "Editor",
    "Lawyer",
    "Doctor",
    "Professor",
    "Principal",
    "Artist",
    "Musician",
    "Photographer",
    "Chef",
    "Public Relations Manager",
    "Financial Analyst",
    "IT Specialist",
    "Business Analyst",
    "Operations Manager",
    "Data Scientist",
    "Product Manager",
    "Quality Assurance Manager",
    "Chief Marketing Officer (CMO)",
    "Chief Human Resources Officer (CHRO)",
    "Chief Operations Officer (COO)",
    "Chief Strategy Officer (CSO)",
    "Chief Information Officer (CIO)",
    "Chief Data Officer (CDO)",
    "Chief Creative Officer (CCO)",
    "Chief Security Officer (CSO)",
    "Chief Legal Officer (CLO)",
    "Chief Communications Officer (CCO)",
    "Chief Diversity Officer (CDO)",
    "Chief Innovation Officer (CIO)",
    "Recruitment Manager",
    "Training and Development Manager",
    "Compensation and Benefits Manager",
    "Employee Relations Manager",
    "HR Business Partner",
    "Organizational Development Manager",
    "Workforce Planning Manager",
    "Digital Marketing Manager",
    "Product Marketing Manager",
    "Brand Management Manager",
    "Market Research Manager",
    "Public Relations Manager",
    "Advertising Manager",
    "Software Engineer",
    "Hardware Engineer",
    "Network Engineer",
    "Mechanical Engineer",
    "Electrical Engineer",
    "Civil Engineer",
    "Biomedical Engineer",
    "Environmental Engineer",
    "Interior Architect",
    "Landscape Architect",
    "Urban Designer",
    "Building Architect",
    "Industrial Designer",
    "Green Architect",
    "Renovation Architect",
    "Business Analyst",
    "Financial Analyst",
    "Data Analyst",
    "Market Analyst",
    "Research Analyst",
    "Systems Analyst",
    "Policy Analyst",
    "Quantitative Analyst",
    "Management Consultant",
    "IT Consultant",
    "Financial Consultant",
    "HR Consultant",
    "Strategy Consultant",
    "Healthcare Consultant",
    "Marketing Consultant",
    "Legal Consultant",
    "Software Developer",
    "Web Developer",
    "Front-End Developer",
    "Back-End Developer",
    "Full Stack Developer",
    "Mobile App Developer",
    "iOS Developer",
    "Android Developer",
    "Game Developer",
    "UI/UX Developer",
    "Embedded Systems Developer",
    "DevOps Engineer",
    "Database Developer",
    "Cloud Developer",
    "Blockchain Developer",
    "Machine Learning Engineer",
    "Artificial Intelligence Developer",
    "Robotics Developer",
    "Augmented Reality Developer",
    "Virtual Reality Developer",
    "Firmware Developer",
    "Automation Developer",
    "Scripting Developer",
    "API Developer",
    "Integration Developer",
    "Quantum Developer",
    "Security Developer",
    "Network Developer",
    "Mobile Game Developer",
    "Software Architect",
    "Computer Vision Developer",
    "Data Engineer",
    "Natural Language Processing Developer",
    "3D Graphics Programmer",
    "Wireless Communication Developer",
    "Embedded Software Engineer",
    "Real-time Systems Developer",
    "Automation Test Developer",
    "GIS Developer (Geographic Information Systems)",
    "Sales Representative",
    "Financial Analyst",
    "Accountant",
    "Marketing Manager",
    "Business Development Manager",
    "Supply Chain Manager",
    "E-commerce Manager",
    "Financial Manager",
    "Retail Store Manager",
    "Graphic Designer",
    "Art Director",
    "Copywriter",
    "Animator",
    "Film Director",
    "Music Composer",
    "Gallery Curator",
    "Art Therapist",
    "Theater Director",
    "Fashion Designer",
    "Executive Assistant",
    "Customer Service Representative",
    "Operations Coordinator",
    "Public Relations Specialist",
    "Supply Chain Analyst",
    "Quality Control Inspector",
    "Business Operations Manager",
    "Logistics Coordinator",
    "Administrative Assistant",
    "Financial Controller",
    "Market Research Analyst",
    "Event Planner",
    "Business Consultant",
    "Procurement Specialist",
    "Business Intelligence Analyst",
    "Technical Support Specialist",
    "Customer Success Manager",
    "Content Marketing Specialist",
    "Compliance Officer",
    "Web Content Manager",
    "SEO Specialist",
    "Investment Analyst",
    "Risk Analyst",
    "Art Conservator",
    "Art Historian",
    "Art Gallery Assistant",
    "Media Planner",
    "Grant Writer",
    "Technical Writer",
    "UX/UI Designer",
    "Interior Decorator",
    "Event Coordinator",
    "Curator",
    "Librarian",
    "Market Development Manager",
    "Publicist",
    "Customer Experience Manager",
    "Inventory Manager",
    "Community Manager",
    "Business Manager",
    "Information Security Analyst",
    "Network Administrator",
    "Technical Project Manager",
    "Systems Engineer",
    "UX Researcher",
    "Environmental Specialist",
    "Corporate Trainer",
    "Property Manager",
    "Program Coordinator",
    "Operations Analyst",
    "Investment Banker",
    "Forensic Accountant",
    "Actuary",
    "Market Development Specialist",
  ];
}

class FilterValueAndMode{
  final int mode;
  String value;

  FilterValueAndMode({required this.mode,required this.value});
}