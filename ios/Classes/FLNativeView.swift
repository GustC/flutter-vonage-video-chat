import Flutter
import UIKit

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    public var platformView: FlutterPlatformView?

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        if(platformView == nil){
            platformView = FLNativeView(
                frame: frame,
                viewIdentifier: viewId,
                arguments: args,
                binaryMessenger: messenger
            )
        }
        return platformView!
    }

    // public func getPlatformView() -> FlutterPlatformView {
    //     return platformView!
    // }

    public func getView() -> UIView {
        return platformView!.view()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
        print("createNativeView", _view)
                
    }

    func view() -> UIView {
        print ("FLNativeView.view()", _view)
        return _view
    }

    func createNativeView(view _view: UIView) {
        _view.backgroundColor = UIColor.black
        let nativeLabel = UILabel()
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)
        _view.addSubview(nativeLabel)
    }
}
