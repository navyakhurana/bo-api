namespace bo.api.db;


entity MaintenanceOrderLongText {
  key TextObjectType           : String;
  key Language                 : String;
      MaintenanceOrderLongText : LargeString;
  key MaintenanceOrder         : String(12);
};

entity MaintOrderOpLongText {
  key TextObjectType               : String;
  key Language                     : String;
      OrderOperationLongText       : LargeString;
  key MaintenanceOrder             : String(12);
  key MaintenanceOrderOperation    : String;
  key MaintenanceOrderSubOperation : String;
};

entity MaintenanceOrderOperation {
  key MaintenanceOrderOperation    : String;
  key MaintenanceOrderSubOperation : String;
      OperationDescription         : String;
  key MaintenanceOrder             : String(12);
      TextObjectType               : String;
      Language                     : String;
      OrderOperationLongText       : LargeString;
      to_MaintOrderOpLongText      : Composition of many MaintOrderOpLongText
                                       on  to_MaintOrderOpLongText.MaintenanceOrder             = MaintenanceOrder
                                       and to_MaintOrderOpLongText.MaintenanceOrderOperation    = MaintenanceOrderOperation
                                       and to_MaintOrderOpLongText.MaintenanceOrderSubOperation = MaintenanceOrderSubOperation;
};


entity MaintenanceOrder {
  key MaintenanceOrder             : String(12);
      MaintOrdBasicStartDate       : Date;
      MaintOrdBasicEndDate         : Date;
      MaintenanceOrderDesc         : String(50);
      CompanyCode                  : String(10);
      Equipment                    : String;
      EquipmentName                : String;
      MaintenanceOrderType         : String(4);
      TextObjectType               : String;
      Language                     : String;
      MaintenanceOrderLongText     : LargeString;
      MaintenanceOrderOperation    : String;
      MaintenanceOrderSubOperation : String;
      OperationDescription         : String;
      to_MaintenanceOrderLongText  : Composition of many MaintenanceOrderLongText
                                       on to_MaintenanceOrderLongText.MaintenanceOrder = MaintenanceOrder;
      to_MaintenanceOrderOperation : Composition of many MaintenanceOrderOperation
                                       on to_MaintenanceOrderOperation.MaintenanceOrder = MaintenanceOrder;
};

entity Equipment {
  key Equipment                : String;
      EquipmentName            : String;
      ManufacturerPartNmbr     : String;
      ManufacturerSerialNumber : String;
      WorkCenterPlant          : String;
      AssetLocation            : String;
      EquipmentCategory        : String;
      summarization            : String;
      modifiedAt               : DateTime;
      orders                   : Association to many MaintenanceOrder
                                   on orders.Equipment = Equipment;
};
