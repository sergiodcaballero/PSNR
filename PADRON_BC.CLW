  MEMBER('Padron.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('Padron_BC0.CLW')
Padron_BC0:DctInit             PROCEDURE()
Padron_BC0:DctKill             PROCEDURE()
Padron_BC0:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  Padron_BC0:DctInit
  Padron_BC0:FilesInit


DctKill PROCEDURE()
  CODE
  Padron_BC0:DctKill

