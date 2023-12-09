class APIs {
  static const hostconnectivity = 'http://182.180.146.190:8060/api/Tenant';
  static const signin =
      '$hostconnectivity/SignIn?Email={email}&Password={password}';
  static const signup =
      '$hostconnectivity/Signup?CNIC={cnic}&Email={email}&Password={password}&ContactNo={contact}';
  static const buildingalter =
      '$hostconnectivity/AlterationReq?Title={title}&Detail={detail}&HouseId={houseid}';
  static const sendcomplanit =
      '$hostconnectivity/Complaint?Title={complaintT}&Houseid={houseId}&Complaint={complaintdet}';
  static const showcomplaint =
      '$hostconnectivity/ComplaintsList?Houseid={houseid}';
  static const etag =
      '$hostconnectivity/ETagRegistration?Make={make}&Color={color}&RegNo={regno}&Houseid={houseId}&ModelNo={modelNo}&VehicleType={vehicleType}';
  static const petreg =
      '$hostconnectivity/PetRegistration?HouseId={houseId}&PetKind={petkind}&Vaccinated_Due={vaccinationvalidtill}&Vaccinated={vaccinationname}';
  static const billhistory =
      '$hostconnectivity/GetBillsByHouseId?Houseid={houseid}';
  static const generatebill =
      '$hostconnectivity/GetMonthlyBillByID?HouseId={houseid}&DateTime={date}';
  static const emoveaccount =
      '$hostconnectivity/RemoveAccount?Email={email}&Password={password}';

  static const residentdet = '$hostconnectivity/GenerateGatePass';
  static const servantdet = '$hostconnectivity/GenerateGatePass';
  static const visitordet = '$hostconnectivity/GenerateGatePass';
}
