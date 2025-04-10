import Foundation
import CoreBluetooth

class PeripheralManager: NSObject, CBPeripheralManagerDelegate {
    var peripheralManager: CBPeripheralManager!

    override init() {
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            let advertisementData: [String: Any] = [
                CBAdvertisementDataLocalNameKey: "BBBBBB-AAAA"
            ]
            peripheralManager.startAdvertising(advertisementData)
            print("Advertising as BBBBBB-AAAA")
        } else {
            print("Bluetooth not ready: \(peripheral.state.rawValue)")
        }
    }
}

let delegate = PeripheralManager()
RunLoop.main.run()
