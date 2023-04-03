USE MASTER
GO
IF EXISTS(select * from sys.databases where name='SpellBookDB')
DROP DATABASE SpellBookDB
GO


CREATE DATABASE SpellBookDB
ON
	PRIMARY (NAME='SpellBookDB_primary',
	FILENAME='E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\SpellbookDB_Prm.mdf',
	SIZE=4MB,
	MAXSIZE=5MB,
	FILEGROWTH=12%)
LOG ON
	(NAME='SpellBookDB_log',
	FILENAME='E:\Database\MSSQL12.MSSQLSERVER\MSSQL\DATA\SpellBookDB.ldf',
	SIZE=2MB,
	MAXSIZE=25MB,
	FILEGROWTH=17%);
GO

USE SpellBookDB
GO

CREATE TABLE Monster(
	MName varchar(50) NOT NULL,
CR varchar(5),
XP int,
	AC tinyint,
	HitDie tinyint,
	AverageHitPoints int,
	HitDiceSides tinyint,
	Resistances varchar(50),
	Immunities varchar(50),
	FlySpeed tinyint,
	BurrowSpeed tinyint,
	ClimbSpeed tinyint,
	SwimSpeed tinyint,
	WalkSpeed tinyint,
	Truesight varchar(128),
	TremorSense varchar(128),
	Darkvision varchar(128),
	PassiveSense tinyint,
	Languages varchar(256),
	LegendaryActionNum tinyint,
	PRIMARY KEY (MName)
)

CREATE TABLE MonsterAction(
	MName varchar(50) NOT NULL,
	ActName varchar(50) NOT NULL,
	Description varchar(1024),
PRIMARY KEY (MName, ActName),
	FOREIGN KEY (MName) REFERENCES Monster(MName)
)

CREATE TABLE MonsterAttack(
	MName varchar(50) NOT NULL,
	ActName varchar(50) NOT NULL,
	MeleeRange varchar(5),
	NumOfTargets int,
	AverageDamage int,
	NumOfDieDamage tinyint,
	SizeOfDieDamage tinyint,
	ModifierDamager tinyint,
	TypeDamage varchar(20),
	PRIMARY KEY (MName, ActName),
	FOREIGN KEY (MName, ActName) 
REFERENCES MonsterAction(MName, ActName)
)

CREATE TABLE MonsterLegAction(
	MName varchar(50) NOT NULL,
	LegName varchar(50) NOT NULL,
	Description varchar(1024),
	NumActionConsume tinyint,
	PRIMARY KEY (MName, LegName),
	FOREIGN KEY (MName) REFERENCES Monster(MName)
)

CREATE TABLE MonsterReaction(
	MName varchar(50) NOT NULL,
	Name varchar(50) NOT NULL,
	Description varchar(1024),
	PRIMARY KEY (MName, Name),
	FOREIGN KEY (MName) REFERENCES Monster(MName)
)

CREATE TABLE MonsterFeature(
	MName varchar(50) NOT NULL,
Name varchar(50) NOT NULL,
	Description varchar(1024),
	PRIMARY KEY (MName, Name),
	FOREIGN KEY (MName) REFERENCES Monster(MName)
)

CREATE TABLE Spell(
	SName varchar(50) NOT NULL,
Level tinyint,
School varchar(20),
CastingTime varchar(20),
Range varchar(50),
VerbalCom bit,
SomaticCom bit,
Material varchar(20),
MaterialDesc varchar(512),
	PRIMARY KEY (SName)
)


CREATE TABLE MonsterCast(
	MName varchar(50) NOT NULL,
	SName varchar(50) NOT NULL,
	InnateOrLearned varchar(7),
	PRIMARY KEY (MName, SName),
	FOREIGN KEY (MName) REFERENCES Monster(MName),
	FOREIGN KEY (SName) REFERENCES Spell(SName)
)

CREATE TABLE Race(
RName varchar(50) NOT NULL,
Size varchar(20),
Age int,
Speed tinyint,
Alignment varchar(20),
Stat_Mod varchar(20),
Powers varchar(1024),
	PRIMARY KEY (RName)
)

CREATE TABLE RaceCast(
	RName varchar(50) NOT NULL,
SName varchar(50) NOT NULL,
PRIMARY KEY (RName, SName),
	FOREIGN KEY (RName) REFERENCES Race(RName),
	FOREIGN KEY (SName) REFERENCES Spell(SName)
)

CREATE TABLE Class(
CName varchar(50) NOT NULL,
HitDie tinyint,
SpellPerLevel varchar(20),
CantripsPerLevel varchar(20),
SpellCastingAbility varchar(20),
Features varchar(4096),
	PRIMARY KEY (CName)
)

CREATE TABLE ClassCast(
	CName varchar(50) NOT NULL,
SName varchar(50) NOT NULL,
PRIMARY KEY (CName, SName),
	FOREIGN KEY (CName) REFERENCES Class(CName),
FOREIGN KEY (SName) REFERENCES Spell(SName)
)

CREATE TABLE Equipment(
EName varchar(50) NOT NULL,
Cost varchar(20),
Weight varchar(20),
	PRIMARY KEY (EName)
)

CREATE TABLE Armor(
	EName varchar(50) NOT NULL,
	AC tinyint,
	StealthDisadv varchar(20),
	DonDoffSpeed varchar(20),
	MaxSpeed tinyint,
	PRIMARY KEY (EName),
	FOREIGN KEY (EName) REFERENCES Class(CName)
)

CREATE TABLE Weapon(
	EName varchar(50) NOT NULL,
	Damage varchar(20),
	Type varchar(50),
	Properties varchar(1024),
	FOREIGN KEY (EName) REFERENCES Class(CName)
)

CREATE TABLE Tool(
	EName varchar(50) NOT NULL,
	Description varchar(1024),
	FOREIGN KEY (EName) REFERENCES Class(CName)
)

CREATE TABLE ProficientWith(
	CName varchar(50) NOT NULL,
EName varchar(50) NOT NULL,
PRIMARY KEY (CName, EName),
	FOREIGN KEY (CName) REFERENCES Class(CName),
FOREIGN KEY (EName) REFERENCES Class(CName)
)

