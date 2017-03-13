  MEMBER('Generar_Cuotas.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('Generar_Cuotas_BC0.CLW')
Generar_Cuotas_BC0:DctInit             PROCEDURE()
Generar_Cuotas_BC0:DctKill             PROCEDURE()
Generar_Cuotas_BC0:FilesInit           PROCEDURE()
    END
    MODULE('Generar_Cuotas_BC1.CLW')
Generar_Cuotas_BC1:DctInit             PROCEDURE()
Generar_Cuotas_BC1:DctKill             PROCEDURE()
Generar_Cuotas_BC1:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  Generar_Cuotas_BC0:DctInit
  Generar_Cuotas_BC1:DctInit
  Generar_Cuotas_BC0:FilesInit
  Generar_Cuotas_BC1:FilesInit


DctKill PROCEDURE()
  CODE
  Generar_Cuotas_BC0:DctKill
  Generar_Cuotas_BC1:DctKill

