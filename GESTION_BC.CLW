  MEMBER('Gestion.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('Gestion_BC0.CLW')
Gestion_BC0:DctInit             PROCEDURE()
Gestion_BC0:DctKill             PROCEDURE()
Gestion_BC0:FilesInit           PROCEDURE()
    END
    MODULE('Gestion_BC1.CLW')
Gestion_BC1:DctInit             PROCEDURE()
Gestion_BC1:DctKill             PROCEDURE()
Gestion_BC1:FilesInit           PROCEDURE()
    END
    MODULE('Gestion_BC2.CLW')
Gestion_BC2:DctInit             PROCEDURE()
Gestion_BC2:DctKill             PROCEDURE()
Gestion_BC2:FilesInit           PROCEDURE()
    END
    MODULE('Gestion_BC3.CLW')
Gestion_BC3:DctInit             PROCEDURE()
Gestion_BC3:DctKill             PROCEDURE()
Gestion_BC3:FilesInit           PROCEDURE()
    END
    MODULE('Gestion_BC4.CLW')
Gestion_BC4:DctInit             PROCEDURE()
Gestion_BC4:DctKill             PROCEDURE()
Gestion_BC4:FilesInit           PROCEDURE()
    END
    MODULE('Gestion_BC5.CLW')
Gestion_BC5:DctInit             PROCEDURE()
Gestion_BC5:DctKill             PROCEDURE()
Gestion_BC5:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  Gestion_BC0:DctInit
  Gestion_BC1:DctInit
  Gestion_BC2:DctInit
  Gestion_BC3:DctInit
  Gestion_BC4:DctInit
  Gestion_BC5:DctInit
  Gestion_BC0:FilesInit
  Gestion_BC1:FilesInit
  Gestion_BC2:FilesInit
  Gestion_BC3:FilesInit
  Gestion_BC4:FilesInit
  Gestion_BC5:FilesInit


DctKill PROCEDURE()
  CODE
  Gestion_BC0:DctKill
  Gestion_BC1:DctKill
  Gestion_BC2:DctKill
  Gestion_BC3:DctKill
  Gestion_BC4:DctKill
  Gestion_BC5:DctKill

