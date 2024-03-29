USE [master]
GO
/****** Object:  Database [SFPGESTION]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE DATABASE [SFPGESTION]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SFPGESTION_Data', FILENAME = N'L:\SQLDevs\Data\SFPGESTION.mdf' , SIZE = 84480KB , MAXSIZE = 1536000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'SFPGESTION_Log', FILENAME = N'L:\SQLDevs\Log\SFPGESTION.ldf' , SIZE = 22720KB , MAXSIZE = 410624KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SFPGESTION] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SFPGESTION].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [SFPGESTION] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SFPGESTION] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SFPGESTION] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SFPGESTION] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SFPGESTION] SET ARITHABORT OFF 
GO
ALTER DATABASE [SFPGESTION] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SFPGESTION] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [SFPGESTION] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SFPGESTION] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SFPGESTION] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SFPGESTION] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SFPGESTION] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SFPGESTION] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SFPGESTION] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SFPGESTION] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SFPGESTION] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SFPGESTION] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SFPGESTION] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SFPGESTION] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SFPGESTION] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SFPGESTION] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SFPGESTION] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SFPGESTION] SET RECOVERY FULL 
GO
ALTER DATABASE [SFPGESTION] SET  MULTI_USER 
GO
ALTER DATABASE [SFPGESTION] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [SFPGESTION] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SFPGESTION] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SFPGESTION] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SFPGESTION', N'ON'
GO
USE [SFPGESTION]
GO
/****** Object:  User [ute0020m]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE USER [ute0020m] FOR LOGIN [ute0020m] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [utabl02m]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE USER [utabl02m] FOR LOGIN [utabl02m] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [utabl01m]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE USER [utabl01m] FOR LOGIN [utabl01m] WITH DEFAULT_SCHEMA=[utabl01m]
GO
/****** Object:  User [BGCMZ\L0750328]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE USER [BGCMZ\L0750328] WITH DEFAULT_SCHEMA=[BGCMZ\L0750328]
GO
/****** Object:  User [Backup]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE USER [Backup] FOR LOGIN [Backup] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [tablcontrl_write]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE ROLE [tablcontrl_write]
GO
ALTER ROLE [db_owner] ADD MEMBER [ute0020m]
GO
ALTER ROLE [tablcontrl_write] ADD MEMBER [utabl02m]
GO
ALTER ROLE [db_owner] ADD MEMBER [utabl01m]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BGCMZ\L0750328]
GO
ALTER ROLE [db_owner] ADD MEMBER [Backup]
GO
/****** Object:  Schema [BGCMZ\L0750328]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE SCHEMA [BGCMZ\L0750328]
GO
/****** Object:  Schema [TABL]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE SCHEMA [TABL]
GO
/****** Object:  Schema [utabl01m]    Script Date: 03/06/2019 05:32:54 p.m. ******/
CREATE SCHEMA [utabl01m]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rebuild_ArmarFechaRebuild]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Rebuild_ArmarFechaRebuild]
(
	@fechainicio DATETIME,
	@numorden INT
)
RETURNS DATETIME
AS
BEGIN
	DECLARE @retorno DATETIME;
	
	---------------------------------------------------------------------------------------
	------  Para obtener el nro de dia de la semana
	---------------------------------------------------------------------------------------
	--SET @fechainicio = '2015-12-15 00:00:00';
	
	SET @retorno = DATEADD(day, @numorden * 7, @fechainicio);
	
	/*
	--For Testing Purposes
	PRINT dbo.fn_Rebuild_ArmarFechaRebuild( '2015-12-15 00:00:00', 1 );
	PRINT dbo.fn_Rebuild_ArmarFechaRebuild( '2015-12-15 00:00:00', 13 );
	*/
	
	RETURN @retorno;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rebuild_DeboFrenarEjecucionFechaHora]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Rebuild_DeboFrenarEjecucionFechaHora] 
(
	@diafinalizacion NVARCHAR(3),
	@horafinalizacion NVARCHAR(4)
)
RETURNS BIT
AS
BEGIN
	DECLARE @resource NVARCHAR(20);
	DECLARE @diaactual NVARCHAR(3);
	DECLARE @horaactual NVARCHAR(4);
	DECLARE @numdiaactual INT;
	DECLARE @numdiafinalizacion INT;
	DECLARE @diferenciadias INT;
	
	DECLARE @fechahoraactual DATETIME;
	DECLARE @fechafinalizacion DATETIME;
	DECLARE @fechahorafinalizacion DATETIME;
	DECLARE @strfechahora NVARCHAR(20);
	DECLARE @strhora NVARCHAR(8);
	
	DECLARE @retorno BIT;
	
	---------------------------------------------------------------------------------------
	------  Para validar si la fecha actual (dia y hora) superan los paramtros 
	------  de dia y hora ingresado al SP de rebuid
	---------------------------------------------------------------------------------------
	
	SET @diaactual = SUBSTRING(UPPER(DATENAME(dw, GETDATE())),1,3);
	SET @horaactual = CONVERT(CHAR(2), DATEPART(HH, GETDATE())) + CONVERT(CHAR(2), DATEPART(MI, GETDATE()));
	
	SELECT @numdiaactual = dbo.fn_Rebuild_NumeroDia( @diaactual );
	SELECT @numdiafinalizacion = dbo.fn_Rebuild_NumeroDia( @diafinalizacion );
	
	------  Calculo diferencia de dias
	if(@numdiaactual <= @numdiafinalizacion)
	BEGIN
		SET @diferenciadias = @numdiafinalizacion - @numdiaactual;
	END
	ELSE
	BEGIN
		SET @diferenciadias = @numdiafinalizacion + 7 - @numdiaactual;	
	END
	
	------  FECHA HORA ACTUAL
	SET @fechahoraactual = GETDATE();
	
	------
	------  Armo la Fecha/Hora de finalizacion en formato DATETIME
	------
	SET @strhora = CONVERT(CHAR(2), SUBSTRING(@horafinalizacion, 1, 2)) + ':' + CONVERT(CHAR(2), SUBSTRING(@horafinalizacion, 3, 2)) + ':00';
	
	------  Sumo la diferencia de dias a la fecha actual
	SET @fechafinalizacion = DATEADD(day,@diferenciadias,@fechahoraactual);

	------  Armo la Fecha/Hora de finalizacion
	SET @strfechahora = CONVERT(NVARCHAR(10), @fechafinalizacion, 111) + ' ' + @strhora;
	
	SET @fechahorafinalizacion = CONVERT(DATETIME, @strfechahora, 120);
	
	
	------  Valido si se supero la Fecha/Hora de finalizacion
	SET @retorno = 0;
	
	IF( @fechahoraactual >= @fechahorafinalizacion )
	BEGIN
		SET @retorno = 1;
	END
	
	/*
	--For Testing Purposes
	PRINT dbo.fn_Rebuild_DeboFrenarEjecucionFechaHora( 'SUN', '0300');
	PRINT dbo.fn_Rebuild_DeboFrenarEjecucionFechaHora( 'THU', '1022');
	SELECT GETDATE();
	*/
	
	RETURN @retorno;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rebuild_DeboFrenarEjecucionImmediate]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Rebuild_DeboFrenarEjecucionImmediate] 
(
)
RETURNS BIT
AS
BEGIN
	
	DECLARE @retorno BIT;
	DECLARE @ConfigShutdownVariable NVARCHAR(30);
	
	SET @ConfigShutdownVariable  = 'IMMEDIATE_REBUILD_SHUTDOWN';
	
	---------------------------------------------------------------------------------------
	------  Para validar si debo frenar la ejecucion desde la tabla de configuracion 
	------  INMEDIATE_SHUTDOWN = true
	---------------------------------------------------------------------------------------
	
	SELECT @retorno=(CASE LOWER(CONVERT(VARCHAR, Valor)) WHEN 'false' THEN 0 ELSE 1 END)
	  FROM dbo.tbl_Rebuild_Config 
	 WHERE Atributo = @ConfigShutdownVariable;
	
	/*
	--For Testing Purposes
	PRINT dbo.fn_Rebuild_DeboFrenarEjecucionImmediate( );
	SELECT GETDATE();
	*/
	
	IF(@retorno IS NULL) SET @retorno = 0;

	RETURN @retorno;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rebuild_IndexCanRebuildOnline]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Rebuild_IndexCanRebuildOnline] 
(
	@schemaname nvarchar(130),	
	@tablename nvarchar(130),
	@indexname nvarchar(130),
	@indexType nvarchar(60),
	@allocUnitType nvarchar(60),
	@partitionnum int,
	@defragType varchar(10) = 'REORGANIZE'
)
RETURNS BIT
AS
BEGIN
	---------------------------------------------------------------------------------------
	------  Para poder ejecutar Rebuild Online del indice ninguna de sus claves debe ser 
	------  IMAGE, TEXT, NTEXT, VARCHAR(MAX), NVARCHAR(MAX), VARBINARY(MAX), AND XML
	------  sino falla al ejecutar.
	------  Por ende esta funcion devuelve 0 (cero) - o sea FALSE o sea no puede ejecutar
	---------------------------------------------------------------------------------------
	
	DECLARE @lobData BIT;
	DECLARE @online BIT;

	
	SET @lobData = 0

	-- for clustered indexes, check for columns in the table that use a LOB data type
	IF @indexType = 'CLUSTERED INDEX'
	BEGIN
		SELECT @lobData = 1
		FROM INFORMATION_SCHEMA.COLUMNS SCH
		WHERE	SCH.TABLE_SCHEMA = @schemaname AND
				SCH.TABLE_NAME = @tablename AND
				(SCH.DATA_TYPE IN ('text', 'ntext', 'image') OR 
				SCH.CHARACTER_MAXIMUM_LENGTH = -1)

	END
	-- for non-clustered indexes, check for LOB data type in the included columns
	ELSE IF @indexType = 'NONCLUSTERED INDEX'
	BEGIN
	
		SELECT @lobData = 1
		FROM sys.indexes AS IX
		JOIN sys.index_columns AS IC
			ON IX.object_id = IC.object_id
		JOIN INFORMATION_SCHEMA.COLUMNS AS SCH
			ON IC.column_id = SCH.ORDINAL_POSITION
		WHERE	SCH.TABLE_SCHEMA = @schemaname AND
				SCH.TABLE_NAME = @tablename AND
				IX.name = @indexname AND
				IC.is_included_column = 1 AND
				(SCH.DATA_TYPE IN ('text', 'ntext', 'image') OR SCH.CHARACTER_MAXIMUM_LENGTH = -1)
	
	END
	
	IF (@defragType = 'REBUILD')
	BEGIN
		SET @online = 
				CASE
					WHEN @indexType IN ('XML INDEX', 'PRIMARY XML INDEX') THEN 0
					WHEN @indexType = 'NONCLUSTERED INDEX' AND @allocUnitType = 'LOB_DATA' THEN 0
					WHEN @lobData = 1 THEN 0
					WHEN @partitionnum > 1 THEN 0
					ELSE 1
				END
	END
	ELSE
		SET @online = 0
	
	/*
	--Tabla comun
	PRINT dbo.fn_Rebuild_IndexCanRebuildOnline( 'dbo', 'S_OPTY', 'S_OPTY_M52', 'NONCLUSTERED INDEX', 'IN_ROW_DATA', 1, 'REBUILD');
	
	--Tabla con TEXT entonces sin online
	PRINT dbo.fn_Rebuild_IndexCanRebuildOnline( 'dbo', 'S_BR_MODULE_BIN', 'S_BR_MODULE_BIN_P1', 'CLUSTERED INDEX', 'IN_ROW_DATA', 1, 'REBUILD');

	*/
	
	RETURN @online;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rebuild_NumeroDia]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Rebuild_NumeroDia]
(
	@dia NVARCHAR(3)
)
RETURNS INT
AS
BEGIN
	DECLARE @retorno INT;
	
	---------------------------------------------------------------------------------------
	------  Para obtener el nro de dia de la semana
	---------------------------------------------------------------------------------------
	SET @retorno = 1;
	
	IF( UPPER(@dia) = 'SUN' ) SET @retorno = 1;
	IF( UPPER(@dia) = 'MON' ) SET @retorno = 2;
	IF( UPPER(@dia) = 'TUE' ) SET @retorno = 3;
	IF( UPPER(@dia) = 'WED' ) SET @retorno = 4;
	IF( UPPER(@dia) = 'THU' ) SET @retorno = 5;
	IF( UPPER(@dia) = 'FRI' ) SET @retorno = 6;
	IF( UPPER(@dia) = 'SAT' ) SET @retorno = 7;

	/*
	--For Testing Purposes
	PRINT dbo.fn_Rebuild_NumeroDia( 'SUN' );
	PRINT dbo.fn_Rebuild_NumeroDia( 'THU' );
	SELECT 'Hoy es: ' + CONVERT(CHAR,DATEPART(dw, GETDATE()));
	*/
	
	RETURN @retorno;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rebuild_TableIsLocked]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Rebuild_TableIsLocked] 
(
	@schemaname nvarchar(130),
	@tablename nvarchar(130)
)
RETURNS BIT
AS
BEGIN
	DECLARE @resource NVARCHAR(20);
	DECLARE @cantidad INT;
	DECLARE @locked BIT;

	---------------------------------------------------------------------------------------
	------  Para validar si la tabla esta lockeada
	------  sino lo esta puedo ejecutar el PAGE LOCK / REBUILD.
	---------------------------------------------------------------------------------------
	
	SELECT @schemaname = AX.SchemaName,  @tablename = AX.requested_object_name,  @resource = AX.resource_type,  @cantidad = count(*)
	FROM (
		SELECT LCK.resource_type,
		SCHEMA_NAME(OBJ.schema_id) AS SchemaName,
		   (CASE       
			WHEN resource_type = 'OBJECT'           
				THEN object_name(resource_associated_entity_id)
			WHEN resource_type IN ('DATABASE', 'FILE', 'METADATA') 
				THEN 'N/A'      
			WHEN resource_type IN ('KEY', 'PAGE', 'RID')      
				THEN       (          
					SELECT object_name(object_id)           
					FROM sys.partitions           
					WHERE hobt_id=resource_associated_entity_id      )      
			ELSE 'Undefined'      
			END) AS requested_object_name,    
			LCK.request_status, 
			LCK.request_mode
		FROM sys.dm_tran_locks AS LCK, sys.objects AS OBJ
		WHERE LCK.resource_associated_entity_id = OBJ.object_id
		  AND LCK.resource_type IN ('OBJECT','PAGE')
	) AS AX
	WHERE  AX.SchemaName = @schemaname
	  AND  AX.requested_object_name = @tablename
	GROUP BY AX.resource_type,  AX.SchemaName, AX.requested_object_name, AX.request_status, AX.request_mode;

	SET @locked = 0;
	
	IF( @cantidad > 0 )
		SET @locked = 1;
	
	/*
	--Tabla comun
	PRINT dbo.fn_Rebuild_TableIsLocked( 'dbo', 'CPR_SOLICITUDES');
	PRINT dbo.fn_Rebuild_TableIsLocked( 'dbo', 'tbl_Rebuild_Grupos');
	*/
	
	RETURN @locked;
END
GO
/****** Object:  UserDefinedFunction [dbo].[getDaysInMonth]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getDaysInMonth]
(
	-- Add the parameters for the function here
	@date datetime
)
RETURNS VARCHAR(2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @daysInMonth VARCHAR(2)

	-- Add the T-SQL statements to compute the return value here
	SET @daysInMonth = CONVERT(VARCHAR(2),DAY(DATEADD(DD,-1,DATEADD(MM,DATEDIFF(MM,-1,@date),0))))

	-- Return the result of the function
	RETURN @daysInMonth

END

GO
/****** Object:  UserDefinedFunction [dbo].[lista_int_a_tabla]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[lista_int_a_tabla] (@list nvarchar(MAX))
   RETURNS @tbl TABLE (listpos int IDENTITY(1, 1) NOT NULL,
                       number  int NOT NULL) AS
BEGIN
   DECLARE @startpos int,
           @endpos   int,
           @textpos  int,
           @chunklen smallint,
           @str      nvarchar(4000),
           @tmpstr   nvarchar(4000),
           @leftover nvarchar(4000)

   SET @textpos = 1
   SET @leftover = ''
   WHILE @textpos <= datalength(@list) / 2
   BEGIN
      SET @chunklen = 4000 - datalength(@leftover) / 2
      SET @tmpstr = ltrim(@leftover +
                    substring(@list, @textpos, @chunklen))
      SET @textpos = @textpos + @chunklen

      SET @startpos = 0
      SET @endpos = charindex(' ' COLLATE Slovenian_BIN2, @tmpstr)

      WHILE @endpos > 0
      BEGIN
         SET @str = substring(@tmpstr, @startpos + 1,
                              @endpos - @startpos - 1)
         IF @str <> ''
            INSERT @tbl (number) VALUES(convert(int, @str))
         SET @startpos = @endpos
         SET @endpos = charindex(' ' COLLATE Slovenian_BIN2,
                                 @tmpstr, @startpos + 1)
      END

      SET @leftover = right(@tmpstr, datalength(@tmpstr) / 2 - @startpos)
   END

   IF ltrim(rtrim(@leftover)) <> ''
      INSERT @tbl (number) VALUES(convert(int, @leftover))

   RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[SumatoriaCorrectivo]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  FUNCTION [dbo].[SumatoriaCorrectivo] (@Grupos nvarchar(200), @año int)
RETURNS numeric (10,2)
as
begin

--declare  @grupos nvarchar(100)
--select @grupos ='14,12'

DECLARE @tablaGrupo table
(
codgrupo int
 ) 

Declare @Count int
Set @Count = 1
      While (Charindex(',',@grupos)>0) Begin
        Insert Into @tablaGrupo (codgrupo)
        Select ltrim(rtrim(Substring(@grupos,1,Charindex(',',@grupos)-1)))
        Set @grupos = Substring(@grupos,Charindex(',',@grupos)+1,len(@grupos))
        Set @Count = @Count + 1
      End
	 Insert Into @tablaGrupo (codgrupo)
     Select ltrim(rtrim(@grupos))


	declaRE @SumCorrectivo NUMERIC(10,2)

	SELECT @SumCorrectivo=sum(((horashabiles*baseline)*porccorrectivo) /100 )
	FROM tblRecursos r
		inner join tblperiodos p on r.codperiodo = p.codperiodo
		inner join tblhorasproductivas h on p.codperiodo = h.codperiodo and h.anio=@año
	WHERE r.anio = @año 
		and r.CodGrupo in (select * from @tablaGrupo)

	return @SumCorrectivo
end
GO
/****** Object:  UserDefinedFunction [dbo].[SumatoriaCorrectivoXmes]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  FUNCTION [dbo].[SumatoriaCorrectivoXmes] (@Grupos  nvarchar(200), @año int)
RETURNS numeric (8,2)
as
begin

DECLARE @tablaGrupo table
(
codgrupo int
 ) 

Declare @Count int
Set @Count = 1
      While (Charindex(',',@grupos)>0) Begin
        Insert Into @tablaGrupo (codgrupo)
        Select ltrim(rtrim(Substring(@grupos,1,Charindex(',',@grupos)-1)))
        Set @grupos = Substring(@grupos,Charindex(',',@grupos)+1,len(@grupos))
        Set @Count = @Count + 1
      End
	 Insert Into @tablaGrupo (codgrupo)
     Select ltrim(rtrim(@grupos))


	declaRE @SumCorrectivoXmes numeric(10,2)
	SELECT @SumCorrectivoXmes=sum((((horashabiles*baseline)*porccorrectivo) /100 )*p.codperiodo)
	FROM tblRecursos r
		inner join tblperiodos p on r.codperiodo = p.codperiodo
		inner join tblhorasproductivas h on p.codperiodo = h.codperiodo and h.anio=@año
	WHERE r.anio = @año 
		and r.CodGrupo in (select * from @tablaGrupo)

	return  @SumCorrectivoXmes
end
GO
/****** Object:  UserDefinedFunction [dbo].[TendenciaLinealValorA]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[TendenciaLinealValorA] (@SumCorrectivo numeric (8,2), @valorB numeric (10,2))
RETURNS numeric (10,2)
as
begin
	declare @TendenciaLinealValorA numeric(10,2)
	SELECT @TendenciaLinealValorA=(@SumCorrectivo-@valorB*78)/12
	return @TendenciaLinealValorA
end
GO
/****** Object:  UserDefinedFunction [dbo].[TendenciaLinealValorB]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[TendenciaLinealValorB] (@SumCorrectivo numeric (8,2), @SumCorrectivoXmes numeric (10,2))
RETURNS numeric (10,2)
as
begin
	declare @TendenciaLinealValorB numeric(10,2)
	SELECT @TendenciaLinealValorB=(12*@SumCorrectivoXmes-78*@SumCorrectivo)/(12*650-(78*78))
	return @TendenciaLinealValorB
end
GO
/****** Object:  Table [dbo].[tbl_Rebuild_CalculoStats]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rebuild_CalculoStats](
	[idUltimoCalculo] [int] IDENTITY(1,1) NOT NULL,
	[ultEjecucion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Rebuild_Config]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rebuild_Config](
	[idReorgConfig] [int] IDENTITY(1,1) NOT NULL,
	[Atributo] [varchar](60) NOT NULL,
	[Valor] [sql_variant] NULL,
	[ValorFin] [sql_variant] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Rebuild_Cronograma]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rebuild_Cronograma](
	[idReorgCronograma] [int] IDENTITY(1,1) NOT NULL,
	[groupname] [sysname] NOT NULL,
	[endday] [varchar](6) NULL,
	[endhour] [varchar](4) NULL,
	[paralelismo] [int] NULL,
	[isEnabled] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Rebuild_Exception]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rebuild_Exception](
	[idReorgException] [int] IDENTITY(1,1) NOT NULL,
	[schemaname] [sysname] NOT NULL,
	[tablename] [sysname] NOT NULL,
	[tipoTarea] [varchar](20) NULL,
	[accionRealizar] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Rebuild_ExecutionGrupo]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rebuild_ExecutionGrupo](
	[idReorgExecutionGrupo] [bigint] IDENTITY(1,1) NOT NULL,
	[groupname] [sysname] NOT NULL,
	[horainicio] [datetime] NULL,
	[horafin] [datetime] NULL,
	[idHistoryStatsInicio] [bigint] NULL,
	[idHistoryStatsFin] [bigint] NULL,
	[idReorgExecutionLogInicio] [bigint] NULL,
	[idReorgExecutionLogFin] [bigint] NULL,
	[CantidadTablasProcesadas] [bigint] NULL,
	[CantidadTablasRebuild] [bigint] NULL,
	[CantidadTablasUpStat] [bigint] NULL,
	[CantidadTablasVacias] [bigint] NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [PK_tbl_Rebuild_ExecutionGrupo] PRIMARY KEY CLUSTERED 
(
	[idReorgExecutionGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Rebuild_ExecutionLog]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rebuild_ExecutionLog](
	[idReorgExecutionLog] [bigint] IDENTITY(1,1) NOT NULL,
	[groupname] [sysname] NOT NULL,
	[schemaname] [sysname] NOT NULL,
	[tablename] [sysname] NOT NULL,
	[ulthorainicio] [datetime] NULL,
	[ulthorafin] [datetime] NULL,
 CONSTRAINT [PK_tbl_Rebuild_ExecutionLog] PRIMARY KEY CLUSTERED 
(
	[idReorgExecutionLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Rebuild_ExecutionLogEvento]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rebuild_ExecutionLogEvento](
	[idEventoLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idReorgExecutionLog] [bigint] NULL,
	[origen] [nvarchar](20) NULL,
	[fechahora] [datetime] NULL,
	[mensaje] [nvarchar](500) NULL,
	[JobID] [varchar](6) NULL,
 CONSTRAINT [PK_tbl_Rebuild_ExecutionLogEvento] PRIMARY KEY CLUSTERED 
(
	[idEventoLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Rebuild_Grupos]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rebuild_Grupos](
	[groupname] [sysname] NOT NULL,
	[schemaname] [sysname] NOT NULL,
	[tablename] [sysname] NOT NULL,
	[ordenexec] [bigint] NULL,
	[descripcion] [varchar](200) NULL,
	[tiporebuild] [varchar](20) NULL,
	[fechaUltFullRebuild] [datetime] NULL,
	[ispagelock] [tinyint] NULL,
 CONSTRAINT [PK_tbl_Rebuild_Grupos] PRIMARY KEY CLUSTERED 
(
	[groupname] ASC,
	[schemaname] ASC,
	[tablename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Rebuild_HistoryEstadistica]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Rebuild_HistoryEstadistica](
	[idReorgHistoryStats] [bigint] IDENTITY(1,1) NOT NULL,
	[fechaejecucion] [datetime] NULL,
	[groupname] [sysname] NOT NULL,
	[schemaname] [sysname] NOT NULL,
	[tablename] [sysname] NOT NULL,
	[numrows] [bigint] NULL,
	[reserved] [varchar](40) NOT NULL,
	[data] [varchar](40) NOT NULL,
	[index_size] [varchar](40) NOT NULL,
	[unused] [varchar](40) NOT NULL,
	[processed] [int] NULL,
	[fragmentacion] [numeric](16, 2) NULL,
	[fragmentacionFinal] [numeric](16, 2) NULL,
	[accionTomada] [varchar](10) NULL,
	[idcalculostats] [int] NULL,
	[JobID] [varchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAcuerdos]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAcuerdos](
	[codAcuerdo] [int] IDENTITY(1,1) NOT NULL,
	[codUsuarioresponsable] [int] NOT NULL,
	[nombreAcuerdo] [varchar](100) NOT NULL,
	[evolutivo] [int] NULL,
	[nombreAcuerdoCorto] [varchar](50) NULL,
	[tipo] [varchar](4) NULL,
 CONSTRAINT [PK_tblAcuerdos] PRIMARY KEY CLUSTERED 
(
	[codAcuerdo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAcuerdosHoras]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAcuerdosHoras](
	[numeroGalar] [varchar](5) NULL,
	[acuerdo] [varchar](50) NULL,
	[nombreGala] [varchar](70) NULL,
	[estadoReq] [varchar](14) NULL,
	[categoria] [varchar](14) NULL,
	[estadoAcuerdo] [varchar](14) NULL,
	[estimadoInicial] [varchar](8) NULL,
	[estimadoActual] [varchar](8) NULL,
	[estimadoComprometido] [varchar](8) NULL,
	[incurridoPeriodo] [varchar](8) NULL,
	[incurridoTotal] [varchar](8) NULL,
	[inicioEstimado] [varchar](10) NULL,
	[finEstimado] [varchar](10) NULL,
	[inicioReal] [varchar](10) NULL,
	[finReal] [varchar](10) NULL,
	[finActual] [varchar](30) NULL,
	[tipo] [varchar](17) NULL,
	[codPeriodo] [varchar](2) NULL,
	[año] [varchar](4) NULL,
	[codAcuerdo] [int] NULL,
	[codTipoGalar] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAcuerdosHorasBatch]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAcuerdosHorasBatch](
	[NRO] [varchar](5) NULL,
	[SERVICIO] [varchar](100) NULL,
	[PROYECTO] [varchar](80) NULL,
	[NOMBRE] [varchar](300) NULL,
	[ESTADOREQ] [varchar](20) NULL,
	[CTROCTO] [varchar](4) NULL,
	[CATEGORIA] [varchar](12) NULL,
	[BLOQUEADO] [varchar](1) NULL,
	[RESPACUERDO] [varchar](100) NULL,
	[ESTADOACUERDO] [varchar](14) NULL,
	[ESTIMADOACT] [varchar](9) NULL,
	[INCPROVPERIODO] [varchar](9) NULL,
	[INCPROVTOTAL] [varchar](9) NULL,
	[INCRESTOPERIODO] [varchar](9) NULL,
	[INCRESTOTOTAL] [varchar](9) NULL,
	[FALTAAC] [varchar](10) NULL,
	[FFINAC] [varchar](10) NULL,
	[PRIORSCORP] [varchar](5) NULL,
	[COMPLEJIDAD] [varchar](5) NULL,
	[FINICIOEST] [varchar](10) NULL,
	[FFINEST] [varchar](10) NULL,
	[FINICIOREAL] [varchar](10) NULL,
	[FFINREAL] [varchar](10) NULL,
	[ESTIMADOINI] [varchar](9) NULL,
	[GRUPOAPLIC] [varchar](50) NULL,
	[FINESTCOMPROM] [varchar](10) NULL,
	[ESFESTCOMPROM] [varchar](9) NULL,
	[INCLUIDOENMETRICA] [varchar](2) NULL,
	[ReqxProy] [varchar](2) NULL,
	[Mes] [int] NULL,
	[Año] [int] NULL,
	[FechaActualizacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAcuerdosHorasBatch_tmp]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAcuerdosHorasBatch_tmp](
	[NRO] [varchar](5) NULL,
	[SERVICIO] [varchar](100) NULL,
	[PROYECTO] [varchar](80) NULL,
	[NOMBRE] [varchar](300) NULL,
	[ESTADOREQ] [varchar](20) NULL,
	[CTROCTO] [varchar](4) NULL,
	[CATEGORIA] [varchar](12) NULL,
	[BLOQUEADO] [varchar](1) NULL,
	[RESPACUERDO] [varchar](100) NULL,
	[ESTADOACUERDO] [varchar](14) NULL,
	[ESTIMADOACT] [varchar](9) NULL,
	[INCPROVPERIODO] [varchar](9) NULL,
	[INCPROVTOTAL] [varchar](9) NULL,
	[INCRESTOPERIODO] [varchar](9) NULL,
	[INCRESTOTOTAL] [varchar](9) NULL,
	[FALTAAC] [varchar](10) NULL,
	[FFINAC] [varchar](10) NULL,
	[PRIORSCORP] [varchar](5) NULL,
	[COMPLEJIDAD] [varchar](5) NULL,
	[FINICIOEST] [varchar](10) NULL,
	[FFINEST] [varchar](10) NULL,
	[FINICIOREAL] [varchar](10) NULL,
	[FFINREAL] [varchar](10) NULL,
	[ESTIMADOINI] [varchar](9) NULL,
	[GRUPOAPLIC] [varchar](50) NULL,
	[FINESTCOMPROM] [varchar](10) NULL,
	[ESFESTCOMPROM] [varchar](9) NULL,
	[INCLUIDOENMETRICA] [varchar](2) NULL,
	[ReqxProy] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAreaOportunidad]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAreaOportunidad](
	[cod_AreaOp] [int] IDENTITY(1,1) NOT NULL,
	[descripcionArea] [nvarchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBackLog]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBackLog](
	[CodPeriodo] [int] NULL,
	[Año] [int] NULL,
	[Nro] [varchar](5) NULL,
	[NombreReq] [varchar](max) NULL,
	[Coordinador] [varchar](50) NULL,
	[Prioridad] [int] NULL,
	[ComentarioIngresa] [varchar](100) NULL,
	[Mes1] [varchar](10) NULL,
	[Mes2] [varchar](10) NULL,
	[Mes3] [varchar](10) NULL,
	[Grupo1] [varchar](12) NULL,
	[Grupo2] [varchar](12) NULL,
	[Grupo3] [varchar](12) NULL,
	[Grupo4] [varchar](12) NULL,
	[Grupo5] [varchar](12) NULL,
	[Grupo6] [varchar](12) NULL,
	[Grupo7] [varchar](12) NULL,
	[Grupo8] [varchar](12) NULL,
	[Grupo9] [varchar](12) NULL,
	[Grupo10] [varchar](12) NULL,
	[Grupo11] [varchar](12) NULL,
	[Grupo12] [varchar](12) NULL,
	[Grupo13] [varchar](12) NULL,
	[Grupo14] [varchar](12) NULL,
	[Grupo15] [varchar](12) NULL,
	[Grupo16] [varchar](12) NULL,
	[Grupo17] [varchar](12) NULL,
	[Grupo18] [varchar](12) NULL,
	[Grupo19] [varchar](12) NULL,
	[Grupo20] [varchar](12) NULL,
	[Grupo21] [varchar](12) NULL,
	[Grupo22] [varchar](12) NULL,
	[Grupo23] [varchar](12) NULL,
	[Grupo24] [varchar](12) NULL,
	[Grupo25] [varchar](12) NULL,
	[Grupo26] [varchar](12) NULL,
	[Grupo27] [varchar](12) NULL,
	[Grupo28] [varchar](12) NULL,
	[Grupo29] [varchar](12) NULL,
	[Grupo30] [varchar](12) NULL,
	[Grupo31] [varchar](12) NULL,
	[ComentarioObservaciones] [varchar](500) NULL,
	[ComentarioEspecialistas] [text] NULL,
	[ComentariosGerentes] [text] NULL,
	[codBackLog] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategorias]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategorias](
	[codCategoria] [int] NOT NULL,
	[nombreCategoria] [char](30) NOT NULL,
	[level] [varchar](2) NULL,
	[skill] [varchar](14) NULL,
 CONSTRAINT [PK_tblCategorias] PRIMARY KEY CLUSTERED 
(
	[codCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompany]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompany](
	[codCompany] [int] NOT NULL,
	[company] [varchar](50) NULL,
 CONSTRAINT [PK_tblCompany] PRIMARY KEY CLUSTERED 
(
	[codCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetalleHoras]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetalleHoras](
	[legajo] [varchar](8) NULL,
	[tipoGalar] [varchar](13) NULL,
	[nombreGalar] [varchar](70) NULL,
	[estadoGalar] [varchar](14) NULL,
	[acuerdo] [varchar](50) NULL,
	[estadoAcuerdo] [varchar](14) NULL,
	[categoria] [varchar](12) NULL,
	[incurrido] [numeric](6, 2) NULL,
	[codPeriodo] [int] NULL,
	[año] [int] NULL,
	[numeroGalar] [int] NULL,
	[codTipoGalar] [int] NULL,
	[codGrupo] [int] NULL,
	[codAcuerdo] [int] NULL,
	[codAcuerdoAsignado] [int] NULL,
	[repetido] [int] NULL,
	[finalizado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetalleHorasBatch]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetalleHorasBatch](
	[Nombre] [varchar](100) NULL,
	[Legajo] [varchar](8) NULL,
	[Tipoitem] [varchar](13) NULL,
	[Item] [varchar](300) NULL,
	[RespItem] [varchar](100) NULL,
	[Estadoitem] [varchar](20) NULL,
	[Subitem] [varchar](100) NOT NULL,
	[RespSubitem] [varchar](100) NULL,
	[EstadoSubitem] [varchar](14) NULL,
	[Categoria] [varchar](12) NULL,
	[Incurrido] [varchar](9) NULL,
	[Mes] [int] NULL,
	[Año] [int] NULL,
	[FechaActualizacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetalleHorasGestionGOP]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetalleHorasGestionGOP](
	[codDetalle] [int] IDENTITY(1,1) NOT NULL,
	[codUsuario] [int] NULL,
	[codperiodo] [int] NULL,
	[año] [int] NULL,
	[codSemana] [int] NULL,
	[codGestionOperativa] [int] NULL,
	[incurrido] [numeric](6, 2) NULL,
 CONSTRAINT [PK_tblDetalleHorasGestionGOP] PRIMARY KEY CLUSTERED 
(
	[codDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetalleHorasGOP]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetalleHorasGOP](
	[codDetalle] [int] IDENTITY(1,1) NOT NULL,
	[codUsuario] [int] NULL,
	[codperiodo] [int] NULL,
	[año] [int] NULL,
	[codgrupo] [int] NULL,
	[codacuerdo] [int] NULL,
	[codSemana] [int] NULL,
	[cod_oportunidad] [int] NULL,
	[incurrido] [numeric](6, 2) NULL,
 CONSTRAINT [PK_tblDetalleHorasGOP] PRIMARY KEY CLUSTERED 
(
	[codDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetalleHorasTemp]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetalleHorasTemp](
	[legajo] [varchar](8) NULL,
	[tipoGalar] [varchar](13) NULL,
	[nombreGalar] [varchar](70) NULL,
	[estadoGalar] [varchar](14) NULL,
	[acuerdo] [varchar](50) NULL,
	[estadoAcuerdo] [varchar](14) NULL,
	[categoria] [varchar](12) NULL,
	[incurrido] [varchar](8) NULL,
	[codPeriodo] [int] NULL,
	[año] [int] NULL,
	[numeroGalar] [int] NULL,
	[codTipoGalar] [int] NULL,
	[codGrupo] [int] NULL,
	[codAcuerdo] [int] NULL,
	[codAcuerdoAsignado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocumentosPeerReview]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocumentosPeerReview](
	[codTipoDocumento] [char](5) NOT NULL,
	[DescripcionDocPeer] [char](30) NULL,
 CONSTRAINT [PK_tblDocumentosPeerReview] PRIMARY KEY CLUSTERED 
(
	[codTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstadoOportunidad]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstadoOportunidad](
	[cod_EstadoOp] [int] IDENTITY(1,1) NOT NULL,
	[descripcionEstado] [nvarchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstadoReserva]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstadoReserva](
	[EstadoReservaID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_EstadoReserva] PRIMARY KEY CLUSTERED 
(
	[EstadoReservaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstados]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstados](
	[codEstado] [int] NOT NULL,
	[descripcionEstado] [char](60) NOT NULL,
	[codTipoGalar] [char](10) NOT NULL,
 CONSTRAINT [PK_tblEstados] PRIMARY KEY CLUSTERED 
(
	[codEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstadosPeerReview]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstadosPeerReview](
	[codEstadoPeer] [char](1) NOT NULL,
	[descripcionPeer] [char](10) NOT NULL,
 CONSTRAINT [PK_tblEstadosPeerReview] PRIMARY KEY CLUSTERED 
(
	[codEstadoPeer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEvaluacion]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvaluacion](
	[idItemEvaluacion] [int] NOT NULL,
	[codUsuario] [int] NOT NULL,
	[codUsuarioAlta] [int] NOT NULL,
	[comentario] [text] NOT NULL,
	[anioFiscal] [int] NOT NULL,
	[fechaAlta] [smalldatetime] NULL,
	[ranking] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblEvaluacion] PRIMARY KEY CLUSTERED 
(
	[idItemEvaluacion] ASC,
	[codUsuario] ASC,
	[codUsuarioAlta] ASC,
	[anioFiscal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFacturacion]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFacturacion](
	[codGrupo] [int] NULL,
	[codPeriodo] [int] NULL,
	[Anio] [int] NULL,
	[Nom_Equipo] [varchar](50) NULL,
	[Desc_Equipo] [varchar](300) NULL,
	[Tot_Recursos] [float] NULL,
	[Bas_Recursos] [float] NULL,
	[Gr_Fact_Baseline] [varchar](300) NULL,
	[Adi_Recursos] [float] NULL,
	[Gr_Fact_Adicional] [varchar](300) NULL,
	[Hrs_Evolutivo] [float] NULL,
	[Hrs_GOP] [float] NULL,
	[Hrs_Libres_GOP] [float] NULL,
	[NroFactura] [varchar](20) NULL,
	[Observaciones] [varchar](300) NULL,
	[NroFacturaAdicional] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFaltanteGalarTime]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFaltanteGalarTime](
	[codUsuario] [int] NULL,
	[codMotivo] [int] NULL,
	[HorasGalar] [float] NULL,
	[HorasTime] [float] NULL,
	[codPeriodo] [int] NULL,
	[año] [int] NULL,
	[fechaControl] [datetime] NULL,
	[Descargo] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblG_Reportes]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblG_Reportes](
	[IDREPORTE] [int] IDENTITY(1,1) NOT NULL,
	[SUBGRUPO] [varchar](30) NOT NULL,
	[GRUPO] [varchar](30) NOT NULL,
	[FACTORY] [varchar](50) NOT NULL,
	[FECHA] [smalldatetime] NOT NULL,
	[DESCRIPCION] [varchar](30) NOT NULL,
	[HORASPLANIFICADAS] [float] NULL,
	[PORCENTAJEPLANIFICADAS] [float] NULL,
	[HORASINCURRIDAS] [float] NULL,
	[PORCENTAJEINCURRIDAS] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGalar]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGalar](
	[numGalar] [int] NOT NULL,
	[codTipoGalar] [int] NOT NULL,
	[codSubTipoGalar] [int] NULL,
	[codUsuarioResponsable] [int] NULL,
	[codAcuerdoReferencia] [char](10) NULL,
	[nombreGalar] [char](100) NOT NULL,
	[comentarios] [text] NULL,
	[codGrupo] [int] NULL,
	[Estado] [nvarchar](15) NULL,
 CONSTRAINT [PK_tblGalar_1] PRIMARY KEY CLUSTERED 
(
	[numGalar] ASC,
	[codTipoGalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGestionOperativa]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGestionOperativa](
	[codGestionOperativa] [int] IDENTITY(1,1) NOT NULL,
	[descripcionGestionOp] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGrupoOportunidad]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGrupoOportunidad](
	[cod_GrupoOp] [int] IDENTITY(1,1) NOT NULL,
	[descripcionGrupo] [nvarchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGrupos]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGrupos](
	[codGrupo] [int] IDENTITY(1,1) NOT NULL,
	[nombreGrupo] [varchar](100) NOT NULL,
	[planifica] [int] NULL,
 CONSTRAINT [PK_tblGrupos] PRIMARY KEY CLUSTERED 
(
	[codGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGruposAcuerdos]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGruposAcuerdos](
	[codAcuerdo] [int] NOT NULL,
	[codGrupo] [int] NULL,
	[original] [int] NULL,
 CONSTRAINT [PK_tblGruposAcuerdos] PRIMARY KEY CLUSTERED 
(
	[codAcuerdo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGruposCapacidad]    Script Date: 03/06/2019 05:32:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGruposCapacidad](
	[codGrupo] [int] NULL,
	[codPeriodo] [int] NULL,
	[año] [int] NULL,
	[compromiso] [numeric](18, 0) NULL,
	[target] [numeric](18, 0) NULL,
	[liberado] [numeric](18, 0) NULL,
	[codResponsable] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGruposGOP]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGruposGOP](
	[codGrupoGOP] [int] IDENTITY(1,1) NOT NULL,
	[nombreGrupoGOP] [varchar](100) NULL,
	[codGrupo] [int] NOT NULL,
 CONSTRAINT [PK_tblGruposGOP] PRIMARY KEY CLUSTERED 
(
	[codGrupoGOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHorasExtraMyTE]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHorasExtraMyTE](
	[Period] [varchar](8) NOT NULL,
	[EmployeeCode] [varchar](9) NOT NULL,
	[WBS] [varchar](20) NOT NULL,
	[HourType] [int] NOT NULL,
	[TotalHours] [float] NOT NULL,
	[Supervisor] [varchar](75) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHorasExtraOPP]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHorasExtraOPP](
	[fecha] [datetime] NOT NULL,
	[aplicacion] [varchar](50) NOT NULL,
	[motivo] [varchar](50) NOT NULL,
	[cantidadcincuenta] [float] NULL,
	[cantidadcien] [float] NULL,
	[responsable] [int] NULL,
	[comentarios] [varchar](200) NULL,
	[periodo] [int] NOT NULL,
	[codUsuario] [varchar](50) NULL,
	[idHora] [int] IDENTITY(1,1) NOT NULL,
	[facturable] [int] NULL,
	[aprobada] [int] NOT NULL,
 CONSTRAINT [PK_tblHorasExtraOPP] PRIMARY KEY CLUSTERED 
(
	[idHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHorasProductivas]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHorasProductivas](
	[codPeriodo] [int] NULL,
	[Anio] [int] NULL,
	[DiasHabiles] [int] NULL,
	[HorasHabiles] [int] NULL,
	[HorasProd] [float] NULL,
	[HorasNoProd] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIncidentesHorasBatch]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIncidentesHorasBatch](
	[NRO] [varchar](5) NULL,
	[NOMBRE] [varchar](300) NULL,
	[SERVICIO] [varchar](100) NULL,
	[ESTADO] [varchar](20) NULL,
	[TIPO] [varchar](17) NULL,
	[FLIMITE] [varchar](10) NULL,
	[FINCIDENTE] [varchar](10) NULL,
	[FRESOLUCION] [varchar](10) NULL,
	[RECASIGNADO] [varchar](100) NULL,
	[INCPROVPERIODO] [varchar](10) NULL,
	[INCPROVTOTAL] [varchar](10) NULL,
	[INCRESTOPERIODO] [varchar](10) NULL,
	[INCRESTOTOTAL] [varchar](10) NULL,
	[Mes] [int] NULL,
	[Año] [int] NULL,
	[FechaActualizacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIncidentesHorasBatch_tmp]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIncidentesHorasBatch_tmp](
	[NRO] [varchar](5) NULL,
	[NOMBRE] [varchar](300) NULL,
	[SERVICIO] [varchar](100) NULL,
	[ESTADO] [varchar](20) NULL,
	[TIPO] [varchar](17) NULL,
	[FLIMITE] [varchar](10) NULL,
	[FINCIDENTE] [varchar](10) NULL,
	[FRESOLUCION] [varchar](10) NULL,
	[RECASIGNADO] [varchar](100) NULL,
	[INCPROVPERIODO] [varchar](10) NULL,
	[INCPROVTOTAL] [varchar](10) NULL,
	[INCRESTOPERIODO] [varchar](10) NULL,
	[INCRESTOTOTAL] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInformePeriodoGOP]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInformePeriodoGOP](
	[codperiodo] [int] NULL,
	[año] [int] NULL,
	[id_oportunidad] [int] NULL,
	[nombre] [nvarchar](255) NULL,
	[col] [nvarchar](100) NULL,
	[skill] [nvarchar](100) NULL,
	[hs_planificadas] [float] NULL,
	[hs_reales] [float] NULL,
	[fecha_reporte] [datetime] NULL,
	[fecha_proceso] [datetime] NULL,
	[fecha_target] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblItemEvaluacion]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblItemEvaluacion](
	[idItemEvaluacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_tblItemEvaluacion] PRIMARY KEY CLUSTERED 
(
	[idItemEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMotivos]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMotivos](
	[codMotivo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOBS]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOBS](
	[codOBS] [int] IDENTITY(1,1) NOT NULL,
	[OBS] [varchar](50) NULL,
 CONSTRAINT [PK_tblOBS] PRIMARY KEY CLUSTERED 
(
	[codOBS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOportunidad]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOportunidad](
	[cod_Oportunidad] [int] NULL,
	[NombreOportunidad] [varchar](max) NULL,
	[Fecha_Proceso] [datetime] NULL,
	[cod_estadoop] [int] NULL,
	[cod_grupoop] [int] NULL,
	[cod_areaop] [int] NULL,
	[Inicio] [datetime] NULL,
	[Fin] [datetime] NULL,
	[cod_ownerop] [int] NULL,
	[Avance] [int] NULL,
	[descripcion] [varchar](max) NULL,
	[descripcion_estado] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOportunidad_TMP]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOportunidad_TMP](
	[id_original] [int] NULL,
	[id_opp] [int] NULL,
	[c_colGrupo] [nvarchar](255) NULL,
	[c_col] [nvarchar](255) NULL,
	[codGrupo] [int] NULL,
	[categoria_L0] [nvarchar](255) NULL,
	[categoria_L1] [nvarchar](255) NULL,
	[Nombre_Oportunidad] [nvarchar](255) NULL,
	[skill] [nvarchar](255) NULL,
	[codAcuerdo] [int] NULL,
	[f_ROp] [nvarchar](255) NULL,
	[g_inicio] [datetime] NULL,
	[g_fin] [datetime] NULL,
	[Avance] [int] NULL,
	[g_duracion_semanas] [int] NULL,
	[madurez] [nvarchar](255) NULL,
	[area] [nvarchar](255) NULL,
	[grupo] [nvarchar](255) NULL,
	[M_0] [float] NULL,
	[M_1] [float] NULL,
	[M_2] [float] NULL,
	[M_3] [float] NULL,
	[M_4] [float] NULL,
	[M_5] [float] NULL,
	[M_6] [float] NULL,
	[M_7] [float] NULL,
	[M_8] [float] NULL,
	[M_9] [float] NULL,
	[M_10] [float] NULL,
	[M_11] [float] NULL,
	[M_12] [float] NULL,
	[fa_proceso] [datetime] NULL,
	[codGrupoGOP] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOportunidadHist]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOportunidadHist](
	[codPeriodo] [int] NULL,
	[anio] [int] NULL,
	[codAcuerdo] [int] NULL,
	[codGrupo] [int] NULL,
	[cod_oportunidad] [int] NULL,
	[HorasSolicitadasOpp] [numeric](7, 2) NULL,
	[Fecha_Proceso] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOwnerOportunidad]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOwnerOportunidad](
	[cod_OwnerOp] [int] IDENTITY(1,1) NOT NULL,
	[descripcionOwner] [nvarchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblParametros]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParametros](
	[codParametro] [int] IDENTITY(1,1) NOT NULL,
	[desParametro] [varchar](50) NULL,
	[desValor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblParametros] PRIMARY KEY CLUSTERED 
(
	[codParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblParticipantes]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParticipantes](
	[codUsuario] [int] NOT NULL,
	[numGalar] [int] NOT NULL,
	[codTipoGalar] [int] NOT NULL,
	[codAcuerdo] [int] NOT NULL,
	[codGrupo] [int] NOT NULL,
 CONSTRAINT [PK_tblParticipantes_1] PRIMARY KEY CLUSTERED 
(
	[codUsuario] ASC,
	[numGalar] ASC,
	[codTipoGalar] ASC,
	[codAcuerdo] ASC,
	[codGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblParticipantesComentarios]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParticipantesComentarios](
	[codParticipante] [int] NOT NULL,
	[numGalar] [int] NOT NULL,
	[codTipoGalar] [int] NOT NULL,
	[codAcuerdo] [int] NOT NULL,
	[codUsuarioAlta] [int] NOT NULL,
	[comentario] [text] NOT NULL,
	[ranking] [int] NOT NULL,
	[codGrupo] [int] NOT NULL,
	[anioFiscal] [int] NOT NULL,
 CONSTRAINT [PK_tblParticipantesComentarios_1] PRIMARY KEY CLUSTERED 
(
	[codParticipante] ASC,
	[numGalar] ASC,
	[codTipoGalar] ASC,
	[codAcuerdo] ASC,
	[codUsuarioAlta] ASC,
	[codGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPeerReview]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPeerReview](
	[codTipoDocumento] [char](5) NOT NULL,
	[codAcuerdo] [char](10) NOT NULL,
	[numGalar] [int] NOT NULL,
	[codEstadoPeer] [char](1) NOT NULL,
	[codUsuarioController] [int] NOT NULL,
	[codUsuarioRevisor] [int] NOT NULL,
	[codUsuario] [int] NOT NULL,
	[fechaLimite] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tblPeerReview] PRIMARY KEY CLUSTERED 
(
	[codTipoDocumento] ASC,
	[codAcuerdo] ASC,
	[numGalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPerfil]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPerfil](
	[codPerfil] [int] IDENTITY(1,1) NOT NULL,
	[des_perfil] [varchar](20) NULL,
 CONSTRAINT [PK_tblPerfil] PRIMARY KEY CLUSTERED 
(
	[codPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPeriodoDetalle]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPeriodoDetalle](
	[CodPeriodo] [int] NOT NULL,
	[mes] [int] NOT NULL,
 CONSTRAINT [PK_tblPeriodoDetalle] PRIMARY KEY CLUSTERED 
(
	[CodPeriodo] ASC,
	[mes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPeriodos]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPeriodos](
	[codPeriodo] [int] NOT NULL,
	[descripcionPeriodo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblPeriodos] PRIMARY KEY CLUSTERED 
(
	[codPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPlanificacion]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPlanificacion](
	[codPlanificacion] [int] IDENTITY(1,1) NOT NULL,
	[codPeriodo] [int] NOT NULL,
	[anio] [int] NOT NULL,
	[codAcuerdo] [int] NULL,
	[codGrupo] [int] NULL,
	[numGalar] [int] NULL,
	[codTipoGalar] [int] NULL,
	[codEstado] [int] NULL,
	[prioridad] [int] NULL,
	[estHoras] [numeric](6, 2) NULL,
	[estFechaADP] [smalldatetime] NULL,
	[estFechaInicio] [smalldatetime] NULL,
	[estFechaFin] [smalldatetime] NULL,
	[desaHoras] [numeric](6, 2) NULL,
	[desaFechaInicio] [smalldatetime] NULL,
	[desaFechaInte] [smalldatetime] NULL,
	[desaFechaHomo] [smalldatetime] NULL,
	[desaFechaPiloto] [smalldatetime] NULL,
	[desaFechaProd] [smalldatetime] NULL,
	[desaFechaFin] [smalldatetime] NULL,
	[seguiHorasAcuerdoGalarInicial] [numeric](7, 2) NULL,
	[seguiHorasAcuerdoGalarComprometidas] [numeric](7, 2) NULL,
	[seguiHorasAcuerdoGalarActual] [numeric](7, 2) NULL,
	[seguiHorasIncurridasTotales] [numeric](7, 2) NULL,
	[seguiHorasIncurridasGalar] [numeric](7, 2) NULL,
	[seguiHorasIncurridasGalarEst] [numeric](7, 2) NULL,
	[seguiFechaFinGalarActual] [smalldatetime] NULL,
	[seguiFechaFinGalarComprometida] [smalldatetime] NULL,
	[seguiFechaFinGalarReal] [smalldatetime] NULL,
	[comentarios] [text] NULL,
	[numProblem] [int] NULL,
	[responsable1] [int] NULL,
	[responsable2] [int] NULL,
	[evolutivo] [int] NULL,
	[finalizado] [int] NULL,
	[FechaUltimaModificacion] [smalldatetime] NULL,
	[CodUsuarioUltimaModificacion] [int] NULL,
	[seguiEstadoAcuerdo] [nvarchar](15) NULL,
	[soporte] [int] NULL,
	[cod_oportunidad] [int] NULL,
	[HorasSolicitadasOpp] [numeric](7, 2) NULL,
	[ComentariosOpp] [varchar](200) NULL,
	[inicio] [datetime] NULL,
	[fin] [datetime] NULL,
	[avance] [int] NULL,
	[NovedadOpp] [int] NULL,
	[FechaUltimaModificacionGOP] [smalldatetime] NULL,
	[codGrupoGOP] [int] NULL,
	[estHorasTotales] [float] NULL,
	[checkPeerReview] [int] NULL,
	[userControlPeerReview] [int] NULL,
	[fechaRealImplementacion] [smalldatetime] NULL,
	[totalPlanificadas] [numeric](6, 2) NULL,
	[incurridoAcumulado] [numeric](6, 2) NULL,
	[desvioMensual] [numeric](6, 2) NULL,
	[desvioAcumulado] [numeric](6, 2) NULL,
	[descripcionOportunidad] [varchar](500) NULL,
	[linkPeerReview] [varchar](300) NULL,
 CONSTRAINT [PK_tblPlanificacion] PRIMARY KEY CLUSTERED 
(
	[codPlanificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPoolesGOPTemp]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPoolesGOPTemp](
	[nombreGrupoGOP] [varchar](100) NULL,
	[lunesMes] [varchar](10) NULL,
	[categoria] [varchar](25) NULL,
	[minutosDias] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPuesto]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPuesto](
	[codUsuario] [int] NOT NULL,
	[NroPuesto] [varchar](5) NULL,
	[NroBoca] [varchar](15) NULL,
	[GALCPU] [varchar](9) NULL,
	[GALMonitor] [varchar](25) NULL,
	[GALTelefono] [varchar](9) NULL,
	[internoAcc] [varchar](5) NULL,
	[codInternoAccTitular] [int] NULL,
	[internoGalicia] [varchar](4) NULL,
	[codInternoGaliciaTitular] [int] NULL,
	[GALCPUExtra] [varchar](9) NULL,
 CONSTRAINT [PK_tblPuesto] PRIMARY KEY CLUSTERED 
(
	[codUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRangoHorario]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRangoHorario](
	[RangoHorarioID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_RangoHorario] PRIMARY KEY CLUSTERED 
(
	[RangoHorarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRecursos]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRecursos](
	[Anio] [int] NOT NULL,
	[CodPeriodo] [int] NOT NULL,
	[CodGrupo] [int] NOT NULL,
	[Baseline] [float] NULL,
	[Adicional] [float] NULL,
	[SobreStaff] [float] NULL,
	[CompromisoTotal] [float] NULL,
	[Evolutivo] [float] NULL,
	[PorcNoProd] [float] NULL,
	[PorcCorrectivo] [float] NULL,
	[Expres] [float] NULL,
	[Funcionales] [float] NULL,
	[Soporte] [float] NULL,
	[Sap] [float] NULL,
	[PorcExpres] [float] NULL,
	[PorcFuncionales] [float] NULL,
	[PorcSoporte] [float] NULL,
	[PorcSap] [float] NULL,
 CONSTRAINT [PK_dbo.tblRecursos] PRIMARY KEY CLUSTERED 
(
	[Anio] ASC,
	[CodPeriodo] ASC,
	[CodGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReservas]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReservas](
	[idReserva] [bigint] IDENTITY(1,1) NOT NULL,
	[Estado] [int] NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Fecha_Modificacion] [datetime] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[TipoReserva] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[MotivoRechazo] [varchar](max) NULL,
	[EstadoReservaID] [int] NOT NULL,
	[Asignacion] [bigint] NOT NULL,
	[RangoHorarioID] [int] NOT NULL,
	[AuthCode] [varchar](max) NULL,
 CONSTRAINT [PK_Reservas] PRIMARY KEY CLUSTERED 
(
	[idReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRiesgoOcurrencia]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRiesgoOcurrencia](
	[codOcurrencia] [smallint] NOT NULL,
	[descripcionocurrencia] [char](15) NOT NULL,
 CONSTRAINT [PK_tblRiesgoOcurrencia] PRIMARY KEY CLUSTERED 
(
	[codOcurrencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRiesgos]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRiesgos](
	[numGalar] [int] NOT NULL,
	[codAcuerdo] [varchar](50) NOT NULL,
	[codSeveridad] [smallint] NOT NULL,
	[codOcurrencia] [smallint] NOT NULL,
	[accionesMitigacion] [char](40) NULL,
	[accionesContingencia] [char](40) NULL,
	[DetalleRiesgo] [varchar](150) NULL,
 CONSTRAINT [PK_tblRiesgos] PRIMARY KEY CLUSTERED 
(
	[numGalar] ASC,
	[codAcuerdo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRiesgoSeveridad]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRiesgoSeveridad](
	[codSeveridad] [smallint] NOT NULL,
	[descripcionSeveridad] [char](10) NOT NULL,
 CONSTRAINT [PK_tblRiesgoSeveridad] PRIMARY KEY CLUSTERED 
(
	[codSeveridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRolTipoReservaDias]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRolTipoReservaDias](
	[RolTipoReservaDiasID] [bigint] IDENTITY(1,1) NOT NULL,
	[RolID] [int] NOT NULL,
	[TipoReservaID] [int] NOT NULL,
	[CantidadDias] [int] NOT NULL,
 CONSTRAINT [PK_RolTipoReservaDias] PRIMARY KEY CLUSTERED 
(
	[RolTipoReservaDiasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSemanasGOP]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSemanasGOP](
	[codSemana] [int] IDENTITY(1,1) NOT NULL,
	[codperiodo] [int] NULL,
	[año] [int] NULL,
	[lunes] [datetime] NULL,
 CONSTRAINT [PK_tblSemanasGOP] PRIMARY KEY CLUSTERED 
(
	[codSemana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSkill]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSkill](
	[codSkill] [int] NULL,
	[nombreSkill] [varchar](14) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubTipoGalar]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubTipoGalar](
	[codSubTipoGalar] [int] NULL,
	[codTipoGalar] [int] NULL,
	[descripcionSubTipoGalar] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbltemporalGOP]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbltemporalGOP](
	[id_referencie] [int] IDENTITY(1,1) NOT NULL,
	[id_oportunidad] [int] NULL,
	[nombre] [nvarchar](255) NULL,
	[col] [nvarchar](100) NULL,
	[skill] [nvarchar](100) NULL,
	[hs_planificadas] [float] NULL,
	[hs_reales] [float] NULL,
	[fecha_reporte] [datetime] NULL,
	[fecha_proceso] [datetime] NULL,
	[fecha_target] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTimeDetailsTemp]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTimeDetailsTemp](
	[EnterpriseID] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[Personnel] [nvarchar](8) NULL,
	[CompanyCode] [nvarchar](4) NULL,
	[CostCenter] [nvarchar](8) NULL,
	[TRPeriod] [nvarchar](10) NULL,
	[TRSubmittedWith] [nvarchar](10) NULL,
	[ActualSubmissionDateTime] [nvarchar](16) NULL,
	[ProcessedPeriod] [nvarchar](50) NULL,
	[ProcessedDateTimeIntoSAP] [nvarchar](16) NULL,
	[Date] [nvarchar](10) NULL,
	[WBS] [nvarchar](8) NULL,
	[Hours] [int] NULL,
	[TRStatus] [nchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoGalar]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoGalar](
	[codTipoGalar] [int] NOT NULL,
	[descripcionTipoGalar] [char](30) NULL,
 CONSTRAINT [PK_tblTipoGalar] PRIMARY KEY CLUSTERED 
(
	[codTipoGalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoReserva]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoReserva](
	[TipoReservaID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionCorta] [varchar](4) NULL,
 CONSTRAINT [PK_TipoReserva] PRIMARY KEY CLUSTERED 
(
	[TipoReservaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarios]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarios](
	[codUsuario] [int] IDENTITY(1,1) NOT NULL,
	[codCategoria] [int] NULL,
	[codAcuerdoOriginal] [int] NULL,
	[nombreUsuario] [varchar](100) NOT NULL,
	[apellidousuario] [varchar](100) NULL,
	[legajo] [nvarchar](8) NULL,
	[numEmpleado] [int] NULL,
	[estado] [int] NULL,
	[codSupervisor] [int] NULL,
	[foto] [varchar](50) NULL,
	[fechaNacimiento] [datetime] NULL,
	[codCompany] [int] NULL,
	[codOBS] [int] NULL,
	[codEspecialista] [int] NULL,
	[codGerente] [int] NULL,
	[codPerfil] [int] NULL,
	[Request_Date] [datetime] NULL,
	[Planned_start] [datetime] NULL,
	[ActualStart] [datetime] NULL,
	[Planned_End] [datetime] NULL,
	[Actual_End] [datetime] NULL,
	[observaciones] [varchar](200) NULL,
	[galar] [decimal](3, 2) NULL,
	[NroEmpleadoAcc] [varchar](9) NULL,
	[EnterpriseIDAcc] [varchar](100) NULL,
	[SerialNumberNotebook] [varchar](50) NULL,
	[codSkill] [int] NULL,
	[ingresoAccenture] [datetime] NULL,
 CONSTRAINT [PK_tblUsuarios] PRIMARY KEY CLUSTERED 
(
	[codUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuariosGrupo]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuariosGrupo](
	[codUsuario] [int] NOT NULL,
	[codGrupo] [int] NOT NULL,
	[asignacionOriginal] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuariosMail]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuariosMail](
	[codUsuario] [int] NOT NULL,
	[mail] [varchar](90) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[id_mail] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblUsuariosMail] PRIMARY KEY CLUSTERED 
(
	[id_mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuariosTelefono]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuariosTelefono](
	[codUsuario] [int] NOT NULL,
	[numero] [varchar](15) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[id_tel] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblUsuariosTelefono] PRIMARY KEY CLUSTERED 
(
	[id_tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVersiones]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVersiones](
	[codPeriodo] [varchar](2) NOT NULL,
	[anio] [varchar](4) NOT NULL,
	[codGrupo] [int] NOT NULL,
	[numVersion] [float] NOT NULL,
	[Descripcion] [varchar](150) NULL,
	[fecha] [smalldatetime] NULL,
 CONSTRAINT [PK_tblVersiones] PRIMARY KEY CLUSTERED 
(
	[codPeriodo] ASC,
	[anio] ASC,
	[codGrupo] ASC,
	[numVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWBS]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWBS](
	[codWBS] [int] IDENTITY(1,1) NOT NULL,
	[WBS] [nvarchar](8) NOT NULL,
	[Descripcion] [nvarchar](30) NULL,
	[codMotivo] [int] NOT NULL,
	[Activa] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWBSAcuerdo]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWBSAcuerdo](
	[codMotivo] [int] NULL,
	[codAcuerdo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tempTabSpaceUsed]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempTabSpaceUsed](
	[table_name] [varchar](250) NULL,
	[row_count] [int] NULL,
	[reserved_size] [varchar](40) NULL,
	[data_size] [varchar](40) NULL,
	[index_size] [varchar](40) NULL,
	[unused_size] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tempTabStatsList]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempTabStatsList](
	[statsname] [varchar](250) NOT NULL,
	[statskeys] [varchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [utabl01m].[__EFMigrationsHistory]    Script Date: 03/06/2019 05:32:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [utabl01m].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vIncurridoRangoMedio]    Script Date: 03/06/2019 05:32:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vIncurridoRangoMedio]
AS
SELECT     TOP 100 PERCENT Factory, AnioMes, Tipo, Numero, Fecha, Servicio, Horas, Legajo
FROM         dbo.TC_Departamentales
ORDER BY AnioMes
GO
/****** Object:  View [dbo].[vPlanificacionDepartamental]    Script Date: 03/06/2019 05:32:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPlanificacionDepartamental]
AS
SELECT     TOP 100 PERCENT dbo.TC_Plan_Servicios.CodFactory, dbo.TC_Plan_Servicios.AnioMes, dbo.TC_Plan_Servicios.CodGrupo, 
                      dbo.TC_Plan_Servicios.CodSubGrupo, dbo.TC_Plan_Servicios.Tipo, dbo.TC_Plan_Servicios.Requerimiento, dbo.TC_Plan_Servicios.Nombre, 
                      dbo.TC_Plan_Servicios.CodServicio, dbo.TC_ABMServicios.Servicio, dbo.TC_Plan_Servicios.HsPlan_Dep, 
                      dbo.TC_Plan_Servicios.Observaciones
FROM         dbo.TC_Plan_Servicios INNER JOIN
                      dbo.TC_ABMServicios ON dbo.TC_Plan_Servicios.CodServicio = dbo.TC_ABMServicios.CodServicio
WHERE     (dbo.TC_Plan_Servicios.HsPlan_Dep > 0)
GO
/****** Object:  View [dbo].[vStatusIncidentes]    Script Date: 03/06/2019 05:32:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[vStatusIncidentes] AS 
SELECT    
l0740527.aplicacion.cod_aplic,
l0740527.aplicacion.desc_aplic,
l0740527.incidente.desc_inc,
l0740527.estado.desc_estado,
l0740527.incidente.prioridad,
l0740527.incidente.id_galar, 
l0740527.galar.desc_galar, 
l0740527.incidente.fec_ingreso,
l0740527.incidente.fec_fin_limite,
l0740527.incidente.fec_inicio_est, 
l0740527.incidente.fec_inicio_real,
l0740527.incidente.fec_fin_est,
l0740527.incidente.fec_fin_real,
l0740527.incidente.observacion,
l0740527.responsable.nom_resp,
(SELECT nom_resp FROM l0740527.responsable WHERE   l0740527.responsable.id_resp = l0740527.incidente.ingresado_por) ingr_por,
(SELECT nom_resp FROM l0740527.responsable WHERE   l0740527.responsable.id_resp = l0740527.incidente.asignado_a ) asig_a,
l0740527.incidente.horas_est,
l0740527.incidente.horas_inc

FROM         
l0740527.incidente,
l0740527.estado, 
l0740527.aplicacion, 
l0740527.responsable,
l0740527.galar

WHERE
l0740527.incidente.id_estado = l0740527.estado.id_estado and
l0740527.incidente.id_aplic = l0740527.aplicacion.id_aplic and
l0740527.aplicacion.resp_aplic =l0740527.responsable.id_resp and
l0740527.incidente.id_galar = l0740527.galar.id_galar

GO
SET IDENTITY_INSERT [dbo].[tbl_Rebuild_CalculoStats] ON 

INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (1, CAST(N'2017-06-17T17:52:52.700' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (2, CAST(N'2017-06-24T10:24:33.127' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (3, CAST(N'2017-07-01T11:26:23.570' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (4, CAST(N'2017-07-09T04:22:18.020' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (5, CAST(N'2017-07-15T11:31:46.657' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (6, CAST(N'2017-07-22T11:50:19.780' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (8, CAST(N'2017-08-05T13:02:22.373' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (11, CAST(N'2017-08-26T11:39:16.203' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (12, CAST(N'2017-09-02T10:24:03.660' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (14, CAST(N'2017-09-16T11:15:52.603' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (16, CAST(N'2017-09-30T11:33:16.590' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (17, CAST(N'2017-10-07T10:28:02.197' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (18, CAST(N'2017-10-14T12:14:02.337' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (19, CAST(N'2017-10-21T11:06:54.760' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (20, CAST(N'2017-10-28T10:56:23.207' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (21, CAST(N'2017-11-04T11:33:13.403' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (22, CAST(N'2017-11-11T10:04:52.900' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (23, CAST(N'2017-11-18T10:55:08.203' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (24, CAST(N'2017-11-25T11:04:22.840' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (25, CAST(N'2017-12-02T11:05:52.233' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (26, CAST(N'2017-12-09T11:08:27.003' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (27, CAST(N'2017-12-16T10:16:23.037' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (29, CAST(N'2017-12-30T11:00:10.030' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (34, CAST(N'2018-02-03T09:30:21.330' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (35, CAST(N'2018-02-10T09:31:44.737' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (36, CAST(N'2018-02-17T09:16:11.513' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (37, CAST(N'2018-02-24T09:24:57.540' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (38, CAST(N'2018-03-03T09:25:59.873' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (39, CAST(N'2018-03-10T09:43:44.047' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (40, CAST(N'2018-03-17T09:28:37.367' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (41, CAST(N'2018-03-24T09:14:01.857' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (42, CAST(N'2018-03-31T09:47:21.473' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (43, CAST(N'2018-04-07T09:39:40.520' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (44, CAST(N'2018-04-14T09:51:47.193' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (45, CAST(N'2018-04-21T09:31:15.650' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (46, CAST(N'2018-04-28T09:25:08.523' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (47, CAST(N'2018-05-05T09:34:15.687' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (49, CAST(N'2018-05-19T09:36:40.280' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (50, CAST(N'2018-05-26T09:27:17.970' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (51, CAST(N'2018-06-02T17:50:12.990' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (52, CAST(N'2018-06-09T09:50:22.833' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (53, CAST(N'2018-06-16T09:44:39.640' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (54, CAST(N'2018-06-23T09:33:03.133' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (55, CAST(N'2018-06-30T09:39:22.803' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (56, CAST(N'2018-07-07T09:22:23.217' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (57, CAST(N'2018-07-14T09:28:39.300' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (59, CAST(N'2018-07-28T09:24:11.917' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (60, CAST(N'2018-08-04T09:44:37.217' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (61, CAST(N'2018-08-11T09:28:22.217' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (62, CAST(N'2018-08-18T09:36:46.343' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (63, CAST(N'2018-08-25T09:31:45.190' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (64, CAST(N'2018-09-01T09:43:29.127' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (66, CAST(N'2018-09-15T10:05:20.800' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (67, CAST(N'2018-09-22T11:16:22.017' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (68, CAST(N'2018-09-29T12:23:34.653' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (69, CAST(N'2018-10-07T15:13:44.820' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (70, CAST(N'2018-10-13T09:24:15.020' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (71, CAST(N'2018-10-20T09:14:19.067' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (72, CAST(N'2018-10-27T20:16:28.760' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (73, CAST(N'2018-11-03T09:37:26.287' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (76, CAST(N'2018-11-24T18:40:21.040' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (77, CAST(N'2018-12-01T09:05:36.890' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (78, CAST(N'2018-12-08T09:20:19.123' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (79, CAST(N'2018-12-15T17:32:06.613' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (80, CAST(N'2018-12-22T11:58:26.390' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (81, CAST(N'2018-12-29T16:08:17.537' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (83, CAST(N'2019-01-12T16:08:53.237' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (84, CAST(N'2019-01-19T17:32:38.367' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (85, CAST(N'2019-01-26T14:31:17.313' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (86, CAST(N'2019-02-02T15:58:51.807' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (87, CAST(N'2019-02-09T17:30:35.623' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (88, CAST(N'2019-02-16T16:37:26.290' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (90, CAST(N'2019-03-02T15:30:23.260' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (91, CAST(N'2019-03-09T16:15:53.830' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (92, CAST(N'2019-03-16T18:06:10.117' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (93, CAST(N'2019-03-23T16:19:15.930' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (94, CAST(N'2019-03-30T17:29:20.083' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (95, CAST(N'2019-04-06T15:26:13.357' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (96, CAST(N'2019-04-13T17:42:05.257' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (97, CAST(N'2019-04-20T17:43:36.840' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (99, CAST(N'2019-05-04T17:43:12.317' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (100, CAST(N'2019-05-11T14:51:06.513' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (101, CAST(N'2019-05-18T17:05:12.620' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (103, CAST(N'2019-06-01T17:04:53.423' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (7, CAST(N'2017-07-29T10:30:00.240' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (9, CAST(N'2017-08-12T11:16:57.600' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (13, CAST(N'2017-09-09T11:20:04.853' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (30, CAST(N'2018-01-06T10:56:14.780' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (74, CAST(N'2018-11-10T09:27:09.310' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (82, CAST(N'2019-01-05T17:27:38.157' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (10, CAST(N'2017-08-19T11:17:30.887' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (15, CAST(N'2017-09-23T11:11:00.237' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (48, CAST(N'2018-05-12T09:43:26.760' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (98, CAST(N'2019-04-27T23:53:17.510' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (28, CAST(N'2017-12-23T11:05:08.427' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (31, CAST(N'2018-01-13T11:28:54.900' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (32, CAST(N'2018-01-20T10:10:55.153' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (65, CAST(N'2018-09-08T09:54:12.590' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (75, CAST(N'2018-11-17T09:14:19.007' AS DateTime))
GO
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (33, CAST(N'2018-01-27T09:29:45.013' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (58, CAST(N'2018-07-21T09:33:54.453' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (89, CAST(N'2019-02-23T16:26:02.043' AS DateTime))
INSERT [dbo].[tbl_Rebuild_CalculoStats] ([idUltimoCalculo], [ultEjecucion]) VALUES (102, CAST(N'2019-05-25T17:31:07.520' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Rebuild_CalculoStats] OFF
SET IDENTITY_INSERT [dbo].[tbl_Rebuild_Config] ON 

