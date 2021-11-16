import Cocoa
import FlutterMacOS
import bitsdojo_window_macos 

class MainFlutterWindow: BitsdojoWindow {
  // See: https://pub.dev/packages/bitsdojo_window#for-macos-apps
  override func bitsdojo_window_configure() -> UInt {
    return BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP
  }

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
