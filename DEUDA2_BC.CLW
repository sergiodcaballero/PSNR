  MEMBER('Deuda2.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('Deuda2_BC0.CLW')
Deuda2_BC0:DctInit             PROCEDURE()
Deuda2_BC0:DctKill             PROCEDURE()
Deuda2_BC0:FilesInit           PROCEDURE()
    END
    MODULE('Deuda2_BC1.CLW')
Deuda2_BC1:DctInit             PROCEDURE()
Deuda2_BC1:DctKill             PROCEDURE()
Deuda2_BC1:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  Deuda2_BC0:DctInit
  Deuda2_BC1:DctInit
  Deuda2_BC0:FilesInit
  Deuda2_BC1:FilesInit


DctKill PROCEDURE()
  CODE
  Deuda2_BC0:DctKill
  Deuda2_BC1:DctKill

