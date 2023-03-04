CREATE TABLE `bookings` (
  `BookingID` int NOT NULL,
  `Date` date NOT NULL,
  `TableNumber` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID_idx` (`CustomerID`),
  CONSTRAINT `Customers_ID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `contactdetails` (
  `ContactID` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `CustomerID` int NOT NULL,
  `StaffID` int DEFAULT NULL,
  PRIMARY KEY (`ContactID`),
  KEY `StaffID_idx` (`StaffID`),
  KEY `Customer_ID_idx` (`CustomerID`),
  CONSTRAINT `Customerss_ID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Staffs_ID` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `customers` (
  `CustomerID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `menucontent` (
  `MenuID` int NOT NULL,
  `MenuItemID` int NOT NULL,
  KEY `MenuID_idx` (`MenuID`),
  KEY `MenuItemID_idx` (`MenuItemID`),
  CONSTRAINT `MenuItems_ID` FOREIGN KEY (`MenuItemID`) REFERENCES `menuitems` (`MenuItemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Menuss_ID` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `menuitems` (
  `MenuItemID` int NOT NULL,
  `Course` varchar(45) NOT NULL,
  `Starter` varchar(45) NOT NULL,
  `Desert` varchar(45) NOT NULL,
  PRIMARY KEY (`MenuItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `menus` (
  `MenuID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Cuisine` varchar(45) NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `orderdeliverystatus` (
  `DeliveryID` int NOT NULL,
  `Date` date NOT NULL,
  `Status` varchar(45) NOT NULL,
  `OrderID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `OrderID_idx` (`OrderID`),
  KEY `StaffID_idx` (`StaffID`),
  CONSTRAINT `Orders_ID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderId`),
  CONSTRAINT `Staffss_ID` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `orders` (
  `OrderId` int NOT NULL,
  `Date` date NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,0) NOT NULL,
  `CustomerID` int NOT NULL,
  `MenuID` int NOT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `CustomerID_idx` (`CustomerID`),
  KEY `MenuID_idx` (`MenuID`),
  CONSTRAINT `Customersss_ID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Menus_ID` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `roles` (
  `RoleID` int NOT NULL,
  `Role` varchar(45) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Salary` int NOT NULL,
  `RoleID` int NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `RoleID_idx` (`RoleID`),
  CONSTRAINT `Roles_ID` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
