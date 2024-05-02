/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     5/22/2023 11:08:35 PM                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LUGGAGE') and o.name = 'FK_LUGGAGE_CARRIES_CUSTOMER')
alter table LUGGAGE
   drop constraint FK_LUGGAGE_CARRIES_CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHONE') and o.name = 'FK_PHONE_HAS_CUSTOMER')
alter table PHONE
   drop constraint FK_PHONE_HAS_CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHONE') and o.name = 'FK_PHONE_OWNS_ADMIN')
alter table PHONE
   drop constraint FK_PHONE_OWNS_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESERVATION') and o.name = 'FK_RESERVAT_RESERVATI_TRIP')
alter table RESERVATION
   drop constraint FK_RESERVAT_RESERVATI_TRIP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESERVATION') and o.name = 'FK_RESERVAT_RESERVATI_CUSTOMER')
alter table RESERVATION
   drop constraint FK_RESERVAT_RESERVATI_CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRAIN') and o.name = 'FK_TRAIN_ADD_UPDAT_ADMIN')
alter table TRAIN
   drop constraint FK_TRAIN_ADD_UPDAT_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRIP') and o.name = 'FK_TRIP_ADD_UPDAT_ADMIN')
alter table TRIP
   drop constraint FK_TRIP_ADD_UPDAT_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRIP') and o.name = 'FK_TRIP_TAKES_TRAIN')
alter table TRIP
   drop constraint FK_TRIP_TAKES_TRAIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADMIN')
            and   type = 'U')
   drop table ADMIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CUSTOMER')
            and   type = 'U')
   drop table CUSTOMER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LUGGAGE')
            and   name  = 'CARRIES_FK'
            and   indid > 0
            and   indid < 255)
   drop index LUGGAGE.CARRIES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LUGGAGE')
            and   type = 'U')
   drop table LUGGAGE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHONE')
            and   name  = 'OWNS_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHONE.OWNS_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHONE')
            and   name  = 'HAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHONE.HAS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHONE')
            and   type = 'U')
   drop table PHONE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESERVATION')
            and   name  = 'RESERVATION2_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESERVATION.RESERVATION2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESERVATION')
            and   name  = 'RESERVATION_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESERVATION.RESERVATION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RESERVATION')
            and   type = 'U')
   drop table RESERVATION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRAIN')
            and   name  = 'ADD_UPDATE_TRAIN_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRAIN.ADD_UPDATE_TRAIN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRAIN')
            and   type = 'U')
   drop table TRAIN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRIP')
            and   name  = 'ADD_UPDATE_TRIP_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRIP.ADD_UPDATE_TRIP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRIP')
            and   name  = 'TAKES_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRIP.TAKES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRIP')
            and   type = 'U')
   drop table TRIP
go

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN (
   FIRST_NAME           text                 not null,
   LAST_NAME            text                 not null,
   EMAIL                text                 not null,
   PASSWORD             text                 not null,
   ADMIN_ID             int                  IDENTITY(1,1) not null,
   phone                text                 not null,
   constraint PK_ADMIN primary key nonclustered (ADMIN_ID)
)
go

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER (
   FIRST_NAME           text                 not null,
   LAST_NAME            text                 not null,
   CUSTOMER_EMAIL       text                 not null,
   CUSTOMER_PASSWORD    text                 not null,
   CUSTOMER_ID          int                  IDENTITY(1,1) not null,
   phone                text                 not null,
   constraint PK_CUSTOMER primary key nonclustered (CUSTOMER_ID)
)
go

/*==============================================================*/
/* Table: LUGGAGE                                               */
/*==============================================================*/
create table LUGGAGE (
   CUSTOMER_ID          int                  not null,
   NO_OF_BAGS           int                  not null,
   BAGS_WEIGHT          int                  not null
)
go

/*==============================================================*/
/* Index: CARRIES_FK                                            */
/*==============================================================*/
create index CARRIES_FK on LUGGAGE (
CUSTOMER_ID ASC
)
go


/*==============================================================*/
/* Table: RESERVATION                                           */
/*==============================================================*/
create table RESERVATION (
   TRIP_ID              int                  not null,
   CUSTOMER_ID          int                  not null,
   RES_ID               int                  IDENTITY(1,1)    not null,
   RES_DATE             datetime             not null,
   RES_SEAT             int                  not null,
   constraint PK_RESERVATION primary key (TRIP_ID, CUSTOMER_ID)
)
go

/*==============================================================*/
/* Index: RESERVATION_FK                                        */
/*==============================================================*/
create index RESERVATION_FK on RESERVATION (
TRIP_ID ASC
)
go

/*==============================================================*/
/* Index: RESERVATION2_FK                                       */
/*==============================================================*/
create index RESERVATION2_FK on RESERVATION (
CUSTOMER_ID ASC
)
go

/*==============================================================*/
/* Table: TRAIN                                                 */
/*==============================================================*/
create table TRAIN (
   TRAIN_ID             int                  not null,
   TRAIN_NAME           varchar(30)          not null,
   ADMIN_ID             int                  null,
   NO_OF_SEATS          int                  not null,
   AVAILABLE_SEATS      int                  null,
   constraint PK_TRAIN primary key nonclustered (TRAIN_NAME)
)
go

/*==============================================================*/
/* Index: ADD_UPDATE_TRAIN_FK                                   */
/*==============================================================*/
create index ADD_UPDATE_TRAIN_FK on TRAIN (
ADMIN_ID ASC
)
go

/*==============================================================*/
/* Table: TRIP                                                  */
/*==============================================================*/
create table TRIP (
   TRIP_ID              int                  not null,
   ADMIN_ID             int                  null,
   TRAIN_NAME           varchar(30)          not null,
   TRIP_DATE            datetime             not null,
   TRIP_DURATION        int                  not null,
   START_POINT          text                 not null,
   END_POINT            text                 not null,
   constraint PK_TRIP primary key nonclustered (TRIP_ID)
)
go

/*==============================================================*/
/* Index: TAKES_FK                                              */
/*==============================================================*/
create index TAKES_FK on TRIP (
TRAIN_NAME ASC
)
go

/*==============================================================*/
/* Index: ADD_UPDATE_TRIP_FK                                    */
/*==============================================================*/
create index ADD_UPDATE_TRIP_FK on TRIP (
ADMIN_ID ASC
)
go

alter table LUGGAGE
   add constraint FK_LUGGAGE_CARRIES_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID)
go


alter table RESERVATION
   add constraint FK_RESERVAT_RESERVATI_TRIP foreign key (TRIP_ID)
      references TRIP (TRIP_ID)
go

alter table RESERVATION
   add constraint FK_RESERVAT_RESERVATI_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID)
go

alter table TRAIN
   add constraint FK_TRAIN_ADD_UPDAT_ADMIN foreign key (ADMIN_ID)
      references ADMIN (ADMIN_ID)
go

alter table TRIP
   add constraint FK_TRIP_ADD_UPDAT_ADMIN foreign key (ADMIN_ID)
      references ADMIN (ADMIN_ID)
go

alter table TRIP
   add constraint FK_TRIP_TAKES_TRAIN foreign key (TRAIN_NAME)
      references TRAIN (TRAIN_NAME)
go



create table login_user(
   FIRST_NAME           text                 not null,
   LAST_NAME            text                 not null,
   EMAIL                text                 not null,
   PASSWORD             text                 not null,
   ID                   int                  not null,
   phone                text                 not null,
)
go

