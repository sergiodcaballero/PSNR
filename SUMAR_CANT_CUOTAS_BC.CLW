  MEMBER('Sumar_Cant_Cuotas.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('Sumar_Cant_Cuotas_BC0.CLW')
Sumar_Cant_Cuotas_BC0:DctInit             PROCEDURE()
Sumar_Cant_Cuotas_BC0:DctKill             PROCEDURE()
Sumar_Cant_Cuotas_BC0:FilesInit           PROCEDURE()
    END
    MODULE('Sumar_Cant_Cuotas_BC1.CLW')
Sumar_Cant_Cuotas_BC1:DctInit             PROCEDURE()
Sumar_Cant_Cuotas_BC1:DctKill             PROCEDURE()
Sumar_Cant_Cuotas_BC1:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  Sumar_Cant_Cuotas_BC0:DctInit
  Sumar_Cant_Cuotas_BC1:DctInit
  Sumar_Cant_Cuotas_BC0:FilesInit
  Sumar_Cant_Cuotas_BC1:FilesInit


DctKill PROCEDURE()
  CODE
  Sumar_Cant_Cuotas_BC0:DctKill
  Sumar_Cant_Cuotas_BC1:DctKill

