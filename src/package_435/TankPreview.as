package package_435
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.View;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.SkyBox;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.Tank3D;
   import controls.TankWindow2;
   import controls.TankWindowInner;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import flash.utils.Timer;
   import package_1.Main;
   import package_13.Long;
   import package_188.name_560;
   import package_3.GPUCapabilities;
   import package_54.name_102;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   use namespace alternativa3d;
   
   public class TankPreview extends Sprite
   {
      
      private static const const_2478:Number = -1;
      
      private static const const_2482:Number = -150;
      
      private static const const_2481:Number = 0.7;
      
      private static const const_2480:Number = 13;
      
      private static const const_2479:Number = 2.5;
      
      private static const const_2477:Vector3D = new Vector3D(0,0,-1);
       
      
      protected var var_503:Mesh;
      
      private var var_3185:TextureMaterial;
      
      private var window:TankWindow2;
      
      private const const_1692:int = 11;
      
      protected var var_1182:TankWindowInner;
      
      protected var var_546:Object3DContainer;
      
      protected var var_3194:Object3DContainer;
      
      protected var var_3181:Object3DContainer;
      
      protected var camera:Camera3D;
      
      protected var var_3179:TankPreviewStateMachine;
      
      private var timer:Timer;
      
      private var tank:Tank3D;
      
      private var var_3200:Number;
      
      private var var_1034:int;
      
      private var var_3193:int = 0;
      
      private var var_3201:Boolean = true;
      
      private var method_408:Number = 0.017453292519943295;
      
      private var dot1:Number;
      
      protected var var_3183:Timer;
      
      protected var var_3184:Shape;
      
      private var var_3199:Array;
      
      private var var_3189:Object3D;
      
      private var tree1:Object3D;
      
      private var tree2:Object3D;
      
      private var tree3:Object3D;
      
      private var bg2:Object3D;
      
      private var tree4:Object3D;
      
      private var tree5:Object3D;
      
      private var bg:Object3D;
      
      private var window1:Object3D;
      
      private var window2:Object3D;
      
      private var window3:Object3D;
      
      private var var_3186:Array;
      
      private var floor:Object3D;
      
      private var ventilator1:Object3D;
      
      private var ventilator2:Object3D;
      
      private var var_3197:Object3D;
      
      private var var_3192:Object3D;
      
      private var var_3190:Object3D;
      
      private var name_123:Mesh;
      
      private var girders:Object3D;
      
      private var var_3191:Object3D;
      
      private var var_3198:Object3D;
      
      private var var_3187:Array;
      
      private var var_3188:Object3D;
      
      private var pandus1:Object3D;
      
      private var pandus2:Object3D;
      
      private var var_3180:Array;
      
      private var ladder1_part1:Mesh;
      
      private var ladder1_part2:Mesh;
      
      private var ladder2_part1:Mesh;
      
      private var ladder2_part2:Mesh;
      
      private var var_3196:Tanks3DSResource;
      
      private var var_3195:SkyBox;
      
      protected var var_3182:KDContainer;
      
      public function TankPreview(param1:Long, param2:Number = 5)
      {
         this.dot1 = this.method_408 * 0.001;
         super();
         var _loc3_:name_102 = name_102(Main.osgi.getService(name_102));
         this.var_3196 = Tanks3DSResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,613847)));
         this.var_3195 = this.method_183();
         this.var_3200 = param2;
         this.window = new TankWindow2(400,300);
         this.window.header = _loc3_.getText(name_390.const_1157);
         addChild(this.window);
         this.var_546 = new Object3DContainer();
         this.var_3199 = new Array();
         this.var_3186 = new Array();
         this.var_3187 = new Array();
         this.var_3180 = new Array();
         this.var_546.addChild(this.var_3195);
         this.camera = new Camera3D();
         this.camera.view = new View(100,100,GPUCapabilities.constrained);
         this.camera.view.hideLogo();
         addChild(this.camera.view);
         this.var_3181 = new Object3DContainer();
         this.var_546.addChild(this.var_3181);
         this.var_3194 = new Object3DContainer();
         this.var_546.addChild(this.var_3194);
         this.var_3181.addChild(this.camera);
         this.var_3181.z = 225;
         this.var_3181.rotationX = -110 * Math.PI / 180;
         this.camera.z = -910;
         this.camera.x = -20;
         this.camera.y = 80;
         this.var_3181.rotationZ = -150 * Math.PI / 180;
         this.var_1182 = new TankWindowInner(0,0,TankWindowInner.name_2114);
         addChild(this.var_1182);
         this.method_2948(this.var_3196);
         this.method_2946();
         if(GPUCapabilities.method_95)
         {
            this.var_3184 = new Shape();
            this.var_3184.blendMode = BlendMode.ERASE;
         }
         this.var_1182.mouseEnabled = true;
         this.resize(400,300);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame,false,-1);
         this.method_2951();
         if(GPUCapabilities.method_95)
         {
            this.var_3183 = new Timer(1000,1);
            this.var_3183.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_2945);
            this.var_3183.start();
         }
      }
      
      private function method_2951() : void
      {
         this.var_3179 = new TankPreviewStateMachine();
         var _loc1_:name_3199 = new name_3199();
         var _loc2_:ManualRotationState = new ManualRotationState(this.var_3179,stage,_loc1_,this.camera,this.var_3181);
         var _loc3_:name_3198 = new name_3198(this.var_3179,this.var_1182,_loc1_,this.var_3181);
         var _loc4_:name_3201 = new name_3201(this.var_3179,this.var_1182);
         var _loc5_:name_3200 = new name_3200(this.var_3179,this.var_1182,this.var_3181);
         this.var_3179.name_3197(name_3196.MOUSE_DOWN,_loc3_,_loc2_);
         this.var_3179.name_3197(name_3196.MOUSE_DOWN,_loc4_,_loc2_);
         this.var_3179.name_3197(name_3196.MOUSE_DOWN,_loc5_,_loc2_);
         this.var_3179.name_3197(name_3196.name_3205,_loc2_,_loc3_);
         this.var_3179.name_3197(name_3196.name_3203,_loc3_,_loc4_);
         this.var_3179.name_3197(name_3196.name_3202,_loc4_,_loc5_);
         this.var_3179.name_749(_loc4_);
      }
      
      private function method_2945(param1:TimerEvent) : void
      {
         addChild(this.var_3184);
         this.var_3183.removeEventListener(TimerEvent.TIMER_COMPLETE,this.method_2945);
         this.var_3183 = null;
      }
      
      private function method_2949(param1:Mesh, param2:int) : void
      {
         var _loc3_:TextureMaterial = null;
         if(param1.alternativa3d::faceList.material is TextureMaterial)
         {
            _loc3_ = TextureMaterial(param1.alternativa3d::faceList.material);
            _loc3_.texture = this.var_3196.method_765(param2);
            param1.setMaterialToAllFaces(_loc3_);
         }
         else
         {
            param1.setMaterialToAllFaces(param1.alternativa3d::faceList.material);
         }
         if(param1.name.indexOf("cam") >= 0)
         {
            this.var_3199.push(param1);
         }
         else if(param1.name == "Tower")
         {
            this.var_3189 = param1;
         }
         else if(param1.name == "tree1")
         {
            this.tree1 = param1;
         }
         else if(param1.name == "tree2")
         {
            this.tree2 = param1;
         }
         else if(param1.name == "tree3")
         {
            this.tree3 = param1;
         }
         else if(param1.name == "bg2")
         {
            this.bg2 = param1;
         }
         else if(param1.name == "tree4")
         {
            this.tree4 = param1;
         }
         else if(param1.name == "tree5")
         {
            this.tree5 = param1;
         }
         else if(param1.name == "bg")
         {
            this.bg = param1;
         }
         else if(param1.name == "wall_10")
         {
            this.window1 = param1;
         }
         else if(param1.name == "wall_12")
         {
            this.window2 = param1;
         }
         else if(param1.name == "wall_13")
         {
            this.window3 = param1;
         }
         else if(param1.name.indexOf("wall") >= 0)
         {
            this.var_3186.push(param1);
         }
         else if(param1.name == "Object06")
         {
            this.floor = param1;
         }
         else if(param1.name == "vent_1")
         {
            this.ventilator1 = param1;
         }
         else if(param1.name == "vent_2")
         {
            this.ventilator2 = param1;
         }
         else if(param1.name == "Object39")
         {
            this.var_3197 = param1;
         }
         else if(param1.name == "Object15")
         {
            this.var_3192 = param1;
         }
         else if(param1.name == "Object20")
         {
            this.var_3190 = param1;
         }
         else if(param1.name == "girders")
         {
            this.girders = param1;
         }
         else if(param1.name == "Object27")
         {
            this.var_3191 = param1;
         }
         else if(param1.name == "Object08")
         {
            this.var_3198 = param1;
         }
         else if(param1.name.indexOf("lamp") >= 0)
         {
            this.var_3187.push(param1);
         }
         else if(param1.name == "Object133")
         {
            this.var_3188 = param1;
         }
         else if(param1.name == "Object23")
         {
            this.ladder1_part1 = param1;
         }
         else if(param1.name == "Object02")
         {
            this.ladder1_part2 = param1;
         }
         else if(param1.name == "Object24")
         {
            this.ladder2_part1 = param1;
         }
         else if(param1.name == "Object96")
         {
            this.ladder2_part2 = param1;
         }
         else if(param1.name == "pandus_1")
         {
            this.pandus1 = param1;
         }
         else if(param1.name == "pandus_2")
         {
            this.pandus2 = param1;
         }
         else if(param1.name == "Object92")
         {
            this.var_3180.push(param1);
         }
         else
         {
            this.var_3180.push(param1);
         }
      }
      
      protected function method_2948(param1:Tanks3DSResource) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Mesh = null;
         _loc2_ = 0;
         while(_loc2_ < param1.objects.length)
         {
            _loc3_ = param1.objects[_loc2_] as Mesh;
            if(_loc3_ != null)
            {
               if(_loc3_.name != "stuff15")
               {
                  this.method_2949(_loc3_,_loc2_);
               }
            }
            _loc2_++;
         }
         this.var_3180.push(this.ladder1_part1);
         this.var_3180.push(this.ladder1_part2);
         this.var_3180.push(this.ladder2_part1);
         this.var_3180.push(this.ladder2_part2);
         this.var_3189 = this.method_2943(this.var_3189);
         this.bg = this.method_2943(this.bg);
         _loc2_ = 0;
         while(_loc2_ < this.var_3186.length)
         {
            this.var_3186[_loc2_] = this.method_2943(this.var_3186[_loc2_]);
            _loc2_++;
         }
         this.var_3192 = this.method_2943(this.var_3192);
         this.var_3190 = this.method_2943(this.var_3190);
         this.girders = this.method_2943(this.girders);
         this.var_3191 = this.method_2943(this.var_3191);
         _loc2_ = 0;
         while(_loc2_ < this.var_3187.length)
         {
            this.var_3187[_loc2_] = this.method_2943(this.var_3187[_loc2_]);
            _loc2_++;
         }
         this.var_3188 = this.method_2943(this.var_3188);
         this.pandus1 = this.method_2943(this.pandus1);
         this.pandus2 = this.method_2943(this.pandus2);
         _loc2_ = 0;
         while(_loc2_ < this.var_3180.length)
         {
            this.var_3180[_loc2_] = this.method_2943(this.var_3180[_loc2_]);
            _loc2_++;
         }
         this.ventilator1.y += 10;
         this.ventilator2.y += 10;
      }
      
      private function method_2943(param1:Object3D) : BSP
      {
         var _loc2_:BSP = new BSP();
         _loc2_.createTree(param1 as Mesh,false);
         _loc2_.name = param1.name;
         _loc2_.matrix = param1.matrix;
         _loc2_.useLight = param1.useLight;
         _loc2_.useShadowMap = param1.useShadowMap;
         _loc2_.shadowMapAlphaThreshold = param1.shadowMapAlphaThreshold;
         _loc2_.boundMinX = param1.boundMinX;
         _loc2_.boundMinY = param1.boundMinY;
         _loc2_.boundMinZ = param1.boundMinZ;
         _loc2_.boundMaxX = param1.boundMaxX;
         _loc2_.boundMaxY = param1.boundMaxY;
         _loc2_.boundMaxZ = param1.boundMaxZ;
         return _loc2_;
      }
      
      private function method_2942(param1:Object3D) : void
      {
         if(param1 != null)
         {
            this.var_3194.addChild(param1);
         }
      }
      
      protected function method_2946() : void
      {
         var _loc1_:Object3D = null;
         var _loc2_:Vector.<Object3D> = null;
         var _loc3_:Object3D = null;
         this.method_2942(this.var_3189);
         this.method_2942(this.tree1);
         this.method_2942(this.tree2);
         this.method_2942(this.tree3);
         this.method_2942(this.bg2);
         this.method_2942(this.tree4);
         this.method_2942(this.tree5);
         this.method_2942(this.bg);
         this.method_2942(this.window1);
         this.method_2942(this.window2);
         this.method_2942(this.window3);
         for each(_loc3_ in this.var_3186)
         {
            this.method_2942(_loc3_);
         }
         this.method_2942(this.floor);
         this.method_2942(this.ventilator1);
         this.method_2942(this.ventilator2);
         this.method_2942(this.var_3197);
         this.method_2942(this.var_3192);
         this.method_2942(this.var_3190);
         this.method_2942(this.girders);
         this.method_2942(this.var_3191);
         this.method_2942(this.var_3198);
         for each(_loc3_ in this.var_3187)
         {
            this.method_2942(_loc3_);
         }
         this.method_2942(this.var_3188);
         this.var_3182 = new KDContainer();
         this.var_3182.batched = false;
         this.var_3182.threshold = 5;
         this.method_2942(this.var_3182);
         _loc2_ = new Vector.<Object3D>();
         for each(_loc1_ in this.var_3180)
         {
            _loc2_.push(_loc1_);
         }
         _loc2_.push(this.pandus1);
         _loc2_.push(this.pandus2);
         this.var_3182.createTree(_loc2_);
         this.method_59();
         this.var_3182.addChild(this.tank);
      }
      
      private function method_59() : void
      {
         this.tank = new Tank3D();
         this.tank.z = 120;
         this.tank.y = -30;
         this.tank.x = -5;
      }
      
      private function name_769(param1:Mesh, param2:Mesh) : void
      {
         var _loc3_:Vector.<Face> = param1.faces;
         _loc3_[_loc3_.length - 1].alternativa3d::next = param2.alternativa3d::faceList;
         param2.alternativa3d::faceList = null;
         var _loc4_:Vector.<Vertex> = param1.vertices;
         param1.vertices[_loc4_.length - 1].alternativa3d::next = param2.alternativa3d::vertexList;
         param2.alternativa3d::vertexList = null;
      }
      
      private function method_183() : SkyBox
      {
         var _loc1_:ImageResource = ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,179141)));
         var _loc2_:BitmapData = null;
         if(_loc1_ != null && _loc1_.isLoaded)
         {
            _loc2_ = _loc1_.data;
         }
         else
         {
            _loc2_ = new StubBitmapData(16777215);
         }
         return new SkyBox(200000,null,null,null,new TextureMaterial(_loc2_),null,null);
      }
      
      public function hide() : void
      {
         var _loc1_:name_560 = Main.osgi.getService(name_560) as name_560;
         if(_loc1_ != null)
         {
            _loc1_.drawBg();
         }
         this.window = null;
         this.var_1182 = null;
         if(this.var_3183 != null)
         {
            this.var_3183.stop();
            this.var_3183.removeEventListener(TimerEvent.TIMER_COMPLETE,this.method_2945);
            this.var_3183 = null;
         }
         var _loc2_:BitmapData = null;
         if(this.var_3185 != null)
         {
            _loc2_ = this.var_3185.texture;
            this.var_3185.dispose();
            _loc2_.dispose();
         }
         this.var_3195 = null;
         this.var_546 = null;
         this.var_3181 = null;
         this.camera.view.clear();
         this.camera = null;
         this.timer = null;
         this.tank.destroy();
         this.tank = null;
         this.var_503 = null;
         if(this.var_3182 != null)
         {
            this.var_3182.parent.removeChild(this.var_3182);
            this.var_3182.destroyTree();
         }
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public function method_1074(param1:Tanks3DSResource) : void
      {
         this.tank.method_1074(param1);
         this.method_2944();
      }
      
      public function method_1073(param1:Tanks3DSResource) : void
      {
         this.tank.method_1073(param1);
         this.method_2944();
      }
      
      public function method_1072(param1:ImageResource) : void
      {
         this.tank.method_1072(param1);
         this.method_2944();
      }
      
      public function name_1571(param1:MultiframeImageResource) : void
      {
         this.tank.name_1571(param1);
         this.method_2944();
      }
      
      private function method_2944() : void
      {
         if(this.var_3193 < 3)
         {
            ++this.var_3193;
         }
         if(this.var_3193 == 3)
         {
            if(this.var_503 != null && this.tank.contains(this.var_503))
            {
               this.tank.removeChild(this.var_503);
            }
            this.var_503 = this.method_2947(this.tank.name_2415(),const_2477,2.5,13,0.7);
            this.tank.addChildAt(this.var_503,0);
            if(!GPUCapabilities.method_95)
            {
               this.camera.render();
            }
         }
      }
      
      private function method_2947(param1:Mesh, param2:Vector3D, param3:Number, param4:int, param5:Number, param6:uint = 0) : Mesh
      {
         var _loc7_:Wrapper = null;
         var _loc8_:Vertex = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:BitmapData = null;
         var _loc13_:Decal = null;
         param2 = param2.clone();
         param2.normalize();
         var _loc14_:Number = 1e+22;
         var _loc15_:Number = 1e+22;
         var _loc16_:Number = -1e+22;
         var _loc17_:Number = -1e+22;
         var _loc18_:Shape = new Shape();
         var _loc19_:Face = param1.alternativa3d::faceList;
         while(_loc19_ != null)
         {
            _loc7_ = _loc19_.alternativa3d::wrapper;
            while(_loc7_ != null)
            {
               _loc8_ = _loc7_.alternativa3d::vertex;
               _loc9_ = -_loc8_.z / param2.z;
               _loc10_ = _loc8_.x + param2.x * _loc9_;
               _loc11_ = _loc8_.y + param2.y * _loc9_;
               if(_loc10_ < _loc14_)
               {
                  _loc14_ = _loc10_;
               }
               if(_loc10_ > _loc16_)
               {
                  _loc16_ = _loc10_;
               }
               if(_loc11_ < _loc15_)
               {
                  _loc15_ = _loc11_;
               }
               if(_loc11_ > _loc17_)
               {
                  _loc17_ = _loc11_;
               }
               if(_loc7_ == _loc19_.alternativa3d::wrapper)
               {
                  _loc18_.graphics.beginFill(param6);
                  _loc18_.graphics.moveTo(_loc10_,_loc11_);
               }
               else
               {
                  _loc18_.graphics.lineTo(_loc10_,_loc11_);
               }
               _loc7_ = _loc7_.alternativa3d::next;
            }
            _loc19_ = _loc19_.alternativa3d::next;
         }
         _loc14_ = (Math.floor(_loc14_ / param3) - param4) * param3;
         _loc15_ = (Math.floor(_loc15_ / param3) - param4) * param3;
         _loc16_ = (Math.ceil(_loc16_ / param3) + param4) * param3;
         _loc17_ = (Math.ceil(_loc17_ / param3) + param4) * param3;
         var _loc20_:BitmapData = new BitmapData(Math.round((_loc16_ - _loc14_) / param3),Math.round((_loc17_ - _loc15_) / param3),true,0);
         _loc20_.draw(_loc18_,new Matrix(1 / param3,0,0,-1 / param3,-_loc14_ / param3,_loc17_ / param3));
         _loc20_.applyFilter(_loc20_,_loc20_.rect,new Point(),new BlurFilter(param4,param4,BitmapFilterQuality.MEDIUM));
         var _loc21_:TextureMaterial = new TextureMaterial(_loc20_,false,true,MipMapping.PER_PIXEL,param3);
         var _loc22_:Mesh = new Mesh();
         var _loc23_:Vertex = _loc22_.addVertex(_loc14_,_loc17_,0,0,0);
         var _loc24_:Vertex = _loc22_.addVertex(_loc14_,_loc15_,0,0,1);
         var _loc25_:Vertex = _loc22_.addVertex(_loc16_,_loc15_,0,1,1);
         var _loc26_:Vertex = _loc22_.addVertex(_loc16_,_loc17_,0,1,0);
         _loc22_.addQuadFace(_loc23_,_loc24_,_loc25_,_loc26_,_loc21_);
         _loc22_.calculateFacesNormals();
         _loc22_.calculateBounds();
         _loc22_.alpha = param5;
         if(this.var_3185 != null)
         {
            _loc12_ = this.var_3185.texture;
            this.var_3185.dispose();
            _loc12_.dispose();
         }
         this.var_3185 = _loc21_;
         _loc13_ = new Decal();
         _loc13_.createGeometry(_loc22_,true);
         _loc13_.x = _loc22_.x;
         _loc13_.y = _loc22_.y;
         _loc13_.z = _loc22_.z;
         _loc13_.alpha = _loc22_.alpha;
         return _loc13_;
      }
      
      public function resize(param1:Number, param2:Number, param3:int = 0, param4:int = 0) : void
      {
         this.window.width = param1;
         this.window.height = param2;
         this.window.alpha = 1;
         this.var_1182.width = param1 - 11 * 2;
         this.var_1182.height = param2 - 11 * 2;
         this.var_1182.x = 11;
         this.var_1182.y = 11;
         this.var_3201 = false;
         this.camera.view.width = param1 - 11 * 2 - 2;
         this.camera.view.height = param2 - 11 * 2 - 2;
         this.camera.view.x = 11;
         this.camera.view.y = 11;
         this.method_2950();
         this.camera.render();
      }
      
      private function method_2950() : void
      {
         if(GPUCapabilities.method_95)
         {
            this.var_3184.x = this.camera.view.x;
            this.var_3184.y = this.camera.view.y;
            this.var_3184.graphics.clear();
            this.var_3184.graphics.beginFill(16711680);
            this.var_3184.graphics.drawRect(0,0,this.camera.view.width,this.camera.view.height);
            this.var_3184.graphics.endFill();
         }
      }
      
      public function onEnterFrame(param1:Event) : void
      {
         this.var_3179.name_3204();
         this.camera.render();
      }
   }
}
