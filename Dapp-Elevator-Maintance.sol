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
        MaintenanceRecord memory newRecord = MaintenanceRecord(
            _elevatorId,
            _maintenanceDate,
            _maintenanceType,
            _technician,
            true
        );

        maintenanceRecords[recordCount] = newRecord;
        emit MaintenanceScheduled(
            _elevatorId,
            _maintenanceDate,
            _maintenanceType,
            _technician
        );
        recordCount++;
    }
}
