//
//  ViewController.swift
//  appSceneKitMoverLuz
//
//  Created by Guest User on 15/11/24.
//

import UIKit
import SceneKit


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var sliderX: UISlider!
    
    
    @IBOutlet weak var sliderY: UISlider!
    
    
    @IBOutlet weak var sliderZ: UISlider!
    
    
    @IBOutlet weak var textFieldX: UITextField!
    
    
    @IBOutlet weak var textFieldY: UITextField!
    
    
    
    @IBOutlet weak var textFieldZ: UITextField!
    
    
    
    
    @IBOutlet weak var sliderCX: UISlider!
    
    
    @IBOutlet weak var sliderCY: UISlider!
    
    
   
    @IBOutlet weak var sliderCZ: UISlider!
    
    
    @IBOutlet weak var textFieldCX: UITextField!
    
    
    @IBOutlet weak var textFieldCY: UITextField!
    
    
    
    @IBOutlet weak var textFieldCZ: UITextField!
    
    @IBAction func sliderX(_ sender: UISlider) {
        sliderX.value = sender.value
        textFieldX.text  = String(sliderX.value)
        dibujaCubo()
    }
    
    
    @IBAction func sliderY(_ sender: UISlider) {
        sliderY.value = sender.value
        textFieldY.text  = String(sliderY.value)
        dibujaCubo()
    }
    
    
    @IBAction func sliderZ(_ sender: UISlider) {
        sliderZ.value = sender.value
        textFieldZ.text  = String(sliderZ.value)
        dibujaCubo()
    }
    
    
    @IBAction func sliderCX(_ sender: UISlider) {
        sliderCX.value = sender.value
        textFieldCX.text  = String(sliderCX.value)
        dibujaCubo()
        
    }
    
    
    
    @IBAction func sliderCY(_ sender: UISlider) {
        sliderCY.value = sender.value
        textFieldCY.text  = String(sliderCY.value)
        dibujaCubo()
        
    }
    
    
    @IBAction func sliderCZ(_ sender: UISlider) {
        sliderCZ.value = sender.value
        textFieldCZ.text  = String(sliderCZ.value)
        dibujaCubo()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func dibujaCubo(){
        let sceneView = SCNView(frame: self.imageView.frame)
        self.imageView.addSubview(sceneView)
        let scene = SCNScene()
        sceneView.scene = scene
        
        
        //definir camara
        let camara = SCNCamera()
        let camaraNodo = SCNNode()
        camaraNodo.camera = camara
        camaraNodo.position = SCNVector3(self.sliderCX.value, self.sliderCY.value, self.sliderCZ.value)
        
        let luz =  SCNLight()
        luz.type = SCNLight.LightType.spot
        luz.spotInnerAngle =  30.0
        luz.spotOuterAngle = 70.0
        luz.castsShadow = true
        
        
        let nodoLuz = SCNNode()
        nodoLuz.light = luz
        nodoLuz.position = SCNVector3(x: self.sliderX.value, y: self.sliderY.value, z: sliderZ.value)
        
        
        
        let cubo = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        let nodoCubo = SCNNode(geometry: cubo)
        let constraint = SCNLookAtConstraint(target: nodoCubo)
        
        constraint.isGimbalLockEnabled = true
        camaraNodo.constraints = [constraint]
        nodoLuz.constraints = [constraint]
        
        
        //material y sombras
        let geometriaPlano = SCNPlane(width: 50.0, height: 50.0)
        let nodoPlano = SCNNode(geometry: geometriaPlano)
        nodoPlano.eulerAngles = SCNVector3(x: GLKMathDegreesToRadians(-90), y: 0.0, z: 0.0)
        
        nodoPlano.position = SCNVector3(x: 0.0, y: -0.5, z: 0.0)
        
        
        let colorMaterial  = SCNMaterial()
        colorMaterial.diffuse.contents = UIColor.green
        geometriaPlano.materials = [colorMaterial]
        
        
        //agregar los nodos
        scene.rootNode.addChildNode(nodoLuz)
        scene.rootNode.addChildNode(camaraNodo)
        scene.rootNode.addChildNode(nodoCubo)
        scene.rootNode.addChildNode(nodoPlano)
        
        
    }

    
    
    
}

