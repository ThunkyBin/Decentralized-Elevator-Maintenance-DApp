// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ElevatorMaintenance {
    struct MaintenanceRecord {
        uint256 elevatorId;
        uint256 maintenanceDate;
        string maintenanceType;
        string technician;
        bool isActive;
    }

    mapping(uint256 => MaintenanceRecord) public maintenanceRecords;
    uint256 public recordCount;

    event MaintenanceScheduled(
        uint256 recordId,
        uint256 elevatorId,
        uint256 maintenanceDate,
        string maintenanceType,
        string technician
    );

    function scheduleMaintenance(
        uint256 _elevatorId,
        uint256 _maintenanceDate,
        string memory _maintenanceType,
        string memory _technician
    ) public {
        require(_maintenanceDate > 0, "Maintenance date is required");
        require(bytes(_maintenanceType).length > 0, "Maintenance type is required");
        require(bytes(_technician).length > 0, "Technician is required");

        MaintenanceRecord memory newRecord = MaintenanceRecord(
            _elevatorId,
            _maintenanceDate,
            _maintenanceType,
            _technician,
            true
        );

        maintenanceRecords[recordCount] = newRecord;
        emit MaintenanceScheduled(
            recordCount,
            _elevatorId,
            _maintenanceDate,
            _maintenanceType,
            _technician
        );
        recordCount++;
    }
}
