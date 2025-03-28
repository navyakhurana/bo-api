using {bo.api.db as boapi} from '../db/schema';

service BoApi {
  entity MaintenanceOrder          as projection on boapi.MaintenanceOrder;
  entity MaintenanceOrderLongText  as projection on boapi.MaintenanceOrderLongText;
  entity MaintOrderOpLongText      as projection on boapi.MaintOrderOpLongText;
  entity MaintenanceOrderOperation as projection on boapi.MaintenanceOrderOperation;
  entity Equipment                 as projection on boapi.Equipment;
}
