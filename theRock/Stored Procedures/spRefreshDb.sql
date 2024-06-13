CREATE           PROCEDURE [theRock].[spRefreshDb]

AS

UPDATE extract.jsonExtract SET isActive=0, whoChanged=SUSER_SNAME(), whenChanged=GETDATE() WHERE isActive=1

TRUNCATE TABLE extract.jsonExtract

TRUNCATE TABLE theRock.Governorates
INSERT INTO theRock.Governorates
(
	governorate_name
)
SELECT governorate_name
FROM theRock.vwGovernorates

TRUNCATE TABLE theRock.District
INSERT INTO theRock.District
(
	district_name
)
SELECT district_name
FROM theRock.vwDistricts

TRUNCATE TABLE theRock.GovernorateDistricts
INSERT INTO theRock.GovernorateDistricts
(
	governorate_name,
	district_name
)
SELECT governorate_name,
	   district_name
FROM theRock.GovernorateDistricts

TRUNCATE TABLE theRock.SubDistricts
INSERT INTO theRock.SubDistricts
(
	subdistrict_name
)
SELECT subdistrict_name
FROM theRock.vwSubdistricts

TRUNCATE TABLE theRock.Communities
INSERT INTO theRock.Communities
(
	community_name
)
SELECT community_name
FROM theRock.vwCommunities

TRUNCATE TABLE theRock.DistrictSubDistricts
INSERT INTO theRock.DistrictSubDistricts
(
	district_name,
	subdistrict_name
)
SELECT district_name,
	   subdistrict_name
FROM theRock.vwDistrictSubDistricts

TRUNCATE TABLE theRock.SubdistrictCommunity
INSERT INTO SubdistrictCommunity
(
	subdistrict_name,
	community_name
)
SELECT subdistrict_name,
	   community_name
FROM theRock.vwSubdistrictCommunity

TRUNCATE TABLE theRock.Address
INSERT INTO theRock.Address
(
	governorate_name,
	district_name,
	subdistrict_name,
	community_name
)
SELECT governorate_name,
	   district_name,
	   subdistrict_name,
	   community_name
FROM theRock.vwAddresses

TRUNCATE TABLE theRock.Ambulance
INSERT INTO theRock.Ambulance
(
	code,
	phoneNumber,
	name
)
SELECT code,
	   phoneNumber,
	   name
FROM theRock.vwAmbulances

TRUNCATE TABLE theRock.Facility
INSERT INTO theRock.Facility
(
	code,
	contact,
	name,
	type,
	location
)
SELECT code,
	   contact,
	   name,
	   type,
	   location
FROM theRock.vwFacility

--!
TRUNCATE TABLE theRock.FacilityAvailability
INSERT INTO theRock.FacilityAvailability
(
	code,
	contact,
	name,
	type,
	location,
	serviceCode,
	DayOfWeek,
	isAvailable
)
SELECT code,
	   contact,
	   name,
	   type,
	   location,
	   serviceCode,
	   DayOfWeek,
	   isAvailable
FROM theRock.vwFacilityAvailability

--!
TRUNCATE TABLE theRock.Groups
INSERT INTO theRock.Groups
(
	[group],
	groupName
)
SELECT [group],
	   groupName
FROM theRock.vwGroups

TRUNCATE TABLE theRock.GroupServices
INSERT INTO theRock.GroupServices
(
	[group],
	serviceCode
)
SELECT [group],
	   serviceCode
FROM theRock.vwGroupServices

TRUNCATE TABLE theRock.Referrals
INSERT INTO theRock.Referrals
(
	originFacilityCode,
	referralNumber,
	forwardCaseNumber,
	paperFormId,
	referringDoctorName,
	nationalIdNumber,
	firstName,
	lastName,
	fathersName,
	patientGender,
	visibleDisability,
	phoneNumber,
	contactName,
	governorate,
	district,
	subdistrict,
	community,
	residentialStatus,
	dateOfBirth,
	age,
	ageUnit,
	isUrgent,
	referralReason,
	forwardDiagnosis,
	forwardDiagnosisICD10,
	otherDiagnosisSupport,
	otherMedicalDevice,
	otherTreatmentOption,
	medicalHistory,
	clinicalAndMedicalExamination,
	treatmentProvided,
	recommendations,
	height,
	weight,
	bloodPressure,
	oxygen,
	heartRate,
	temperatureInCelsius,
	status,
	createdAt,
	updatedAt,
	[roundedCreatedDate]
)
SELECT originFacilityCode,
	   referralNumber,
	   forwardCaseNumber,
	   paperFormId,
	   referringDoctorName,
	   nationalIdNumber,
	   firstName,
	   lastName,
	   fathersName,
	   patientGender,
	   visibleDisability,
	   phoneNumber,
	   contactName,
	   governorate,
	   district,
	   subdistrict,
	   community,
	   residentialStatus,
	   dateOfBirth,
	   age,
	   ageUnit,
	   isUrgent,
	   referralReason,
	   forwardDiagnosis,
	   forwardDiagnosisICD10,
	   otherDiagnosisSupport,
	   otherMedicalDevice,
	   otherTreatmentOption,
	   medicalHistory,
	   clinicalAndMedicalExamination,
	   treatmentProvided,
	   recommendations,
	   height,
	   weight,
	   bloodPressure,
	   oxygen,
	   heartRate,
	   temperatureInCelsius,
	   status,
	   createdAt,
	   updatedAt,
	   [roundedCreatedDate]
FROM theRock.vwReferrals

TRUNCATE TABLE theRock.Requests
INSERT INTO theRock.Requests
(originFacilityCode,
	   referralNumber,
	   forwardCaseNumber,
	   paperFormId,
	   referringDoctorName,
	   nationalIdNumber,
	   patientGender,
	   visibleDisability,
	   phoneNumber,
	   contactName,
	   governorate,
	   district,
	   subdistrict,
	   community,
	   residentialStatus,
	   dateOfBirth,
	   age,
	   ageUnit,
	   isUrgent,
	   referralReason,
	   forwardDiagnosis,
	   forwardDiagnosisICD10,
	   otherDiagnosisSupport,
	   otherMedicalDevice,
	   otherTreatmentOption,
	   medicalHistory,
	   clinicalAndMedicalExamination,
	   treatmentProvided,
	   recommendations,
	   height,
	   weight,
	   bloodPressure,
	   oxygen,
	   heartRate,
	   temperatureInCelsius,
	   status,
	   createdAt,
	   updatedAt,
	   destinationFacilityCode,
	   requestStatus,
	   requestCreatedAt,
	   referralStatus,
	   requestUpdatedAt,
	   [roundedCreatedDate])
SELECT originFacilityCode,
	   referralNumber,
	   forwardCaseNumber,
	   paperFormId,
	   referringDoctorName,
	   nationalIdNumber,
	   patientGender,
	   visibleDisability,
	   phoneNumber,
	   contactName,
	   governorate,
	   district,
	   subdistrict,
	   community,
	   residentialStatus,
	   dateOfBirth,
	   age,
	   ageUnit,
	   isUrgent,
	   referralReason,
	   forwardDiagnosis,
	   forwardDiagnosisICD10,
	   otherDiagnosisSupport,
	   otherMedicalDevice,
	   otherTreatmentOption,
	   medicalHistory,
	   clinicalAndMedicalExamination,
	   treatmentProvided,
	   recommendations,
	   height,
	   weight,
	   bloodPressure,
	   oxygen,
	   heartRate,
	   temperatureInCelsius,
	   status,
	   createdAt,
	   updatedAt,
	   destinationFacilityCode,
	   requestStatus,
	   requestCreatedAt,
	   referralStatus,
	   requestUpdatedAt,
	   [roundedCreatedDate]
FROM theRock.vwRequests

TRUNCATE TABLE theRock.ServiceAvailability
INSERT INTO theRock.ServiceAvailability
(
serviceCode,
	   isAvailable,
	   DayOfWeek,
	   DayAvailability
	   )
SELECT serviceCode,
	   isAvailable,
	   DayOfWeek,
	   DayAvailability
FROM theRock.vwServiceAvailability

TRUNCATE TABLE theRock.ServiceCatalogue
INSERT INTO theRock.ServiceCatalogue
(
	[group],
	serviceCode,
	subServiceCode
)
SELECT [group],
	   serviceCode,
	   subServiceCode
FROM theRock.vwServiceCatalogue

TRUNCATE TABLE theRock.[Services]
INSERT INTO theRock.[Services]
(
	serviceName,
	serviceCode
)
SELECT serviceName,
	   serviceCode
FROM theRock.vwServices

TRUNCATE TABLE theRock.ServiceSubServices
INSERT INTO theRock.ServiceSubServices
(
	serviceCode,
	subServiceCode
)
SELECT serviceCode,
	   subServiceCode
FROM theRock.vwServiceSubServices

TRUNCATE TABLE theRock.SubServices
INSERT INTO theRock.SubServices
(
	subServiceName,
	subServiceCode
)
SELECT subServiceName,
	   subServiceCode
FROM theRock.vwSubServices

TRUNCATE TABLE theRock.[User]
INSERT INTO theRock.[User]
(
	phoneNumber,
	email,
	name,
	language,
	deviceToken
)
SELECT phoneNumber,
	   email,
	   name,
	   language,
	   deviceToken
FROM theRock.vwUser;

TRUNCATE TABLE theRock.referralFiles
INSERT INTO theRock.referralFiles
(
	referralNumber,
	filePath
)
SELECT referralNumber,
	   [filePath] AS fileContent
FROM theRock.vwReferralFiles
GROUP BY referralNumber,
		 [filePath]

TRUNCATE TABLE theRock.requestFiles
INSERT INTO theRock.requestFiles
(
	requestNumber,
	filePath
)
SELECT requestNumber,
	   [filePath]
FROM theRock.vwRequestFiles
GROUP BY requestNumber,
		 [filePath]

TRUNCATE TABLE theRock.requestServices
INSERT INTO theRock.requestServices
(
	requestNumber,
	serviceCode
)
SELECT requestNumber,
	   serviceCode
FROM theRock.vwRequestServices
GROUP BY requestNumber,
		 serviceCode

TRUNCATE TABLE theRock.referralServices
INSERT INTO theRock.referralServices
(
	referralNumber,
	serviceCode
)
SELECT referralNumber,
	   serviceCode
FROM theRock.vwReferralServices
GROUP BY referralNumber,
		 serviceCode

TRUNCATE TABLE theRock.requestSpecializations
INSERT INTO theRock.requestSpecializations
(
	requestNumber,
	specializationId
)
SELECT requestNumber,
	   specializationId
FROM theRock.requestSpecializations
GROUP BY requestNumber,
		 specializationId

TRUNCATE TABLE theRock.referralSpecializations
INSERT INTO theRock.referralSpecializations
(
	referralNumber,
	specializationId
)
SELECT referralNumber,
	   specializationCode
FROM theRock.vwReferralSpecializations
GROUP BY referralNumber,
		 specializationCode

TRUNCATE TABLE theRock.referralSpecializations
INSERT INTO theRock.referralSpecializations
(
	referralNumber,
	specializationId
)
SELECT referralNumber,
	   specializationCode
FROM theRock.vwReferralSpecializations
GROUP BY referralNumber,
		 specializationCode

TRUNCATE TABLE theRock.requestForwardICD10
INSERT INTO theRock.requestForwardICD10
(
	referralNumber,
	icd10DiagnosisId
)
SELECT referralNumber,
	   icd10DiagnosisId
FROM theRock.vwRequestForwardICD10
GROUP BY referralNumber,
		 icd10DiagnosisId

TRUNCATE TABLE theRock.referralForwardICD10
INSERT INTO theRock.referralForwardICD10
(
	referralNumber,
	icd10DiagnosisId
)
SELECT referralNumber,
	   icd10DiagnosisId
FROM theRock.referralForwardICD10
GROUP BY referralNumber,
		 icd10DiagnosisId

TRUNCATE TABLE theRock.Specializations
INSERT INTO theRock.Specializations
(
	specializationCode --,
--specializationName
)
SELECT specializationCode
FROM theRock.vwSpecializations
GROUP BY specializationCode --specializationName

--!
--TRUNCATE TABLE theRock.Backform
--INSERT INTO theRock.Backform
--		 (originFacilityCode,
--       referralNumber,
--       forwardCaseNumber,
--       paperFormId,
--       referringDoctorName,
--       nationalIdNumber,
--       firstName,
--       lastName,
--       fathersName,
--       patientGender,
--       visibleDisability,
--       phoneNumber,
--       contactName,
--       governorate,
--       district,
--       subdistrict,
--       community,
--       residentialStatus,
--       dateOfBirth,
--       age,
--       ageUnit,
--       isUrgent,
--       referralReason,
--       forwardDiagnosis,
--       forwardDiagnosisICD10,
--       backDiagnosis,
--       backDiagnosisICD10,
--       otherDiagnosisSupport,
--       otherMedicalDevice,
--       otherTreatmentOption,
--       medicalHistory,
--       clinicalAndMedicalExamination,
--       treatmentProvided,
--       recommendations,
--       height,
--       weight,
--       bloodPressure,
--       oxygen,
--       heartRate,
--       temperatureInCelsius,
--       status,
--       createdAt,
--       updatedAt,
--		 [roundedCreatedDate])
--SELECT originFacilityCode,
--       referralNumber,
--       forwardCaseNumber,
--       paperFormId,
--       referringDoctorName,
--       nationalIdNumber,
--       firstName,
--       lastName,
--       fathersName,
--       patientGender,
--       visibleDisability,
--       phoneNumber,
--       contactName,
--       governorate,
--       district,
--       subdistrict,
--       community,
--       residentialStatus,
--       dateOfBirth,
--       age,
--       ageUnit,
--       isUrgent,
--       referralReason,
--       forwardDiagnosis,
--       forwardDiagnosisICD10,
--       backDiagnosis,
--       backDiagnosisICD10,
--       otherDiagnosisSupport,
--       otherMedicalDevice,
--       otherTreatmentOption,
--       medicalHistory,
--       clinicalAndMedicalExamination,
--       treatmentProvided,
--       recommendations,
--       height,
--       weight,
--       bloodPressure,
--       oxygen,
--       heartRate,
--       temperatureInCelsius,
--       status,
--       createdAt,
--       updatedAt,
--		 [roundedCreatedDate]
--FROM theRock.vwBackform

TRUNCATE TABLE theRock.Offer
INSERT INTO theRock.Offer
SELECT
referralNumber,
isAccepted,
isDeclined,
offerStatusCode,
originFacilityCode,
destinationFacilityCode
FROM
theRock.vwOffer

--TRUNCATE TABLE theRock.OfferStatus
--INSERT INTO theRock.OfferStatus
--SELECT
--OfferStatusCode,
--OfferStatusName
--FROM
--[theRock].[vwOfferStatus]

--TRUNCATE TABLE theRock.patientTreatment
--INSERT INTO theRock.patientTreatment
--SELECT
--patientTreatmentId,
--referralNumber,
--isPatientArrived,
--isPatientDeparted,
--isPatientSentBack,
--isPatientReturned,
--destinationTransportationCode,
--returnTransportationCode,
--treatmentNote
--FROM
--theRock.vwPatientTreatment

TRUNCATE TABLE theRock.Transportation
INSERT INTO theRock.Transportation
(
transportationCode,
transportationName
)
SELECT
transportationCode,
transportationName
FROM
theRock.vwTransportation

TRUNCATE TABLE theRock.referralStatus
INSERT INTO theRock.referralStatus
(
referralStatusCode,
referralStatusName
)
SELECT
referralStatusCode,
referralStatusName
FROM
theRock.vwReferralStatus

TRUNCATE TABLE theRock.backformStatus
INSERT INTO theRock.backformStatus
(
backformStatusCode,
backformStatusName
)
SELECT
backformStatusCode,
backformStatusName
FROM
theRock.vwBackformStatus

TRUNCATE TABLE theRock.closureReason
INSERT INTO theRock.closureReason
(
closureReasonCode,
closureReasonName
)
SELECT
closureReasonCode,
closureReasonName
FROM
theRock.vwClosureReason

TRUNCATE TABLE theRock.requestStatus
INSERT INTO theRock.requestStatus
(
requestStatusCode,
requestStatusName
)
SELECT
requestStatusCode,
requestStatusName
FROM
theRock.vwRequestStatus

TRUNCATE TABLE theRock.ageRange
INSERT INTO theRock.ageRange
(
age,
ageRange
)
SELECT
age,
ageRange
FROM
theRock.vwAgeRange

TRUNCATE TABLE theRock.requestDiagnosis
INSERT INTO theRock.requestDiagnosis
(
forwardDiagnosisCode,
forwardDiagnosis
)
SELECT
forwardDiagnosisCode,
forwardDiagnosis
FROM
theRock.vwRequestDiagnosis

TRUNCATE TABLE theRock.referralDiagnosis
INSERT INTO theRock.referralDiagnosis
(
forwardDiagnosisCode,
forwardDiagnosis
)
SELECT
forwardDiagnosisCode,
forwardDiagnosis
FROM
theRock.vwReferralDiagnosis

TRUNCATE TABLE theRock.referralReason
INSERT INTO theRock.referralReason
(
referralReasonCode,
referralReason
)
SELECT
referralReasonCode,
referralReason
FROM
theRock.vwReferralReason

TRUNCATE TABLE theRock.requestReason
INSERT INTO theRock.requestReason
(
requestReasonCode,
requestReason
)
SELECT
requestReasonCode,
requestReason
FROM
theRock.vwRequestReason

TRUNCATE TABLE theRock.Gender
INSERT INTO theRock.Gender
(
genderCode,
genderName
)
SELECT
genderCode,
genderName
FROM
theRock.vwGender

TRUNCATE TABLE theRock.referralNumber
INSERT INTO theRock.referralNumber
(
referralNumber
)
SELECT
referralNumber
FROM
theRock.vwReferralNumber


--RETURN 0