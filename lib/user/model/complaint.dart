class Complaint {
  // int? userid;
  // String? houseno;
  String? complainttitle;
  String? complaintdetails;
  Complaint(
    // this.userid,
    // this.houseno,
    this.complainttitle,
    this.complaintdetails,
  );
  Map<String, dynamic> tojson() => {
        // 'user_id': userid.toString(),
        // 'House_No': houseno,
        'Complaint_Title': complainttitle,
        'complaint_Detail': complaintdetails,

      };
}
