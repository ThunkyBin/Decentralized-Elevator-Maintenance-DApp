# Decentralized Elevator Maintenance DApp

Solidity prototype for recording elevator maintenance schedules on-chain. The
contract stores maintenance records by ID and emits an event every time a new
record is scheduled.

## Contract

`Dapp-Elevator-Maintance.sol` defines `ElevatorMaintenance`.

Each maintenance record stores:

- Elevator ID
- Maintenance date
- Maintenance type
- Technician name
- Active status

## Usage

Call `scheduleMaintenance` with:

```solidity
scheduleMaintenance(
    elevatorId,
    maintenanceDate,
    maintenanceType,
    technician
)
```

The function validates that:

- `maintenanceDate` is not zero
- `maintenanceType` is not empty
- `technician` is not empty

## Events

`MaintenanceScheduled` emits the new `recordId` together with the elevator ID,
date, type, and technician. This makes it easier for frontends and explorers to
track which on-chain record was created.

## Notes

- Dates are expected to be Unix timestamps or another consistent off-chain date
  encoding.
- `maintenanceRecords(recordId)` can be used to read a stored record.
- This is a learning prototype and should be audited before production use.
