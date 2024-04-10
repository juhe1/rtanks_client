package package_416
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Occluder;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.engine3d.primitives.Box;
   import alternativa.engine3d.primitives.Plane;
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.physics.name_888;
   import alternativa.proplib.PropLibRegistry;
   import alternativa.proplib.PropLibrary;
   import alternativa.tanks.Triangle;
   import alternativa.tanks.models.battlefield.BattleView3D;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1194;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.utils.clearDictionary;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_189.CacheURLLoader;
   import package_254.MD5;
   import package_277.name_2392;
   import package_277.name_2398;
   import package_277.name_904;
   import package_351.PropData;
   import package_351.PropGroup;
   import package_352.PropMesh;
   import package_352.name_1682;
   import package_352.name_2677;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_462.ChristmasTreeToyEffect;
   import package_61.name_767;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   use namespace alternativa3d;
   
   public class MapLoader extends EventDispatcher
   {
      
      private static const const_2292:name_888 = new name_888(0,1);
      
      public static const const_2295:Class;
      
      private static const const_2293:int = 255;
      
      private static const const_2294:int = 20;
      
      private static var const_1829:Matrix3D = new Matrix3D();
      
      private static var components:Vector.<Vector3D> = Vector.<Vector3D>([new Vector3D(),new Vector3D(),new Vector3D(1,1,1)]);
       
      
      public var var_3011:XML;
      
      public var var_3019:PropLibRegistry;
      
      private var loader:CacheURLLoader;
      
      private var var_199:Vector.<Object3D>;
      
      private var var_3023:Vector.<Light3D>;
      
      private var var_3018:Vector.<Object3D>;
      
      private var var_3017:Vector.<Occluder>;
      
      private var var_3015:Vector.<CollisionPrimitive>;
      
      private var var_3016:Vector.<Object3D>;
      
      private var var_552:Vector.<Mesh>;
      
      private var textures:Vector.<BitmapData>;
      
      private var var_3025:Object;
      
      private var var_3021:name_767;
      
      private var var_3014:MaterialUsersRegistry;
      
      private var var_3010:BatchTextureBuilder;
      
      private var mipMapResolution:Number = 5;
      
      private var var_3024:NormalsCalculator;
      
      private var var_1718:Vector.<Object3D>;
      
      private var var_3022:Dictionary;
      
      private var var_3020:Dictionary;
      
      private var var_3013:Array;
      
      private var var_11:BattlefieldModel;
      
      private var var_3012:Object3D;
      
      public function MapLoader()
      {
         this.var_3024 = new NormalsCalculator();
         this.var_1718 = new Vector.<Object3D>();
         this.var_3013 = new Array();
         this.var_199 = new Vector.<Object3D>();
         this.var_3018 = new Vector.<Object3D>();
         this.var_3017 = new Vector.<Occluder>();
         this.var_3023 = new Vector.<Light3D>();
         this.var_552 = new Vector.<Mesh>();
         this.var_3022 = new Dictionary();
         this.var_3020 = new Dictionary();
         this.var_3021 = new name_767();
         this.var_3025 = {};
         this.var_11 = Main.osgi.getService(IBattleField) as BattlefieldModel;
         super();
      }
      
      private static function method_2807(param1:Vector3) : Boolean
      {
         return isNaN(param1.x) || isNaN(param1.y) || isNaN(param1.z);
      }
      
      private static function readVector3(param1:XMLList, param2:Vector3) : void
      {
         var _loc3_:XML = null;
         if(param1.length() > 0)
         {
            _loc3_ = param1[0];
            param2.x = Number(_loc3_.x);
            param2.y = Number(_loc3_.y);
            param2.z = Number(_loc3_.z);
         }
         else
         {
            param2.x = param2.y = param2.z = 0;
         }
      }
      
      private static function readVector3D(param1:XMLList, param2:Vector3D) : void
      {
         var _loc3_:XML = null;
         _loc3_ = null;
         if(param1.length() > 0)
         {
            _loc3_ = param1[0];
            param2.x = Number(_loc3_.x);
            param2.y = Number(_loc3_.y);
            param2.z = Number(_loc3_.z);
         }
         else
         {
            param2.x = param2.y = param2.z = 0;
         }
      }
      
      private static function method_2808(param1:XML, param2:String) : String
      {
         if(param1 == null)
         {
            return param2;
         }
         return param1.toString() || param2;
      }
      
      public function load(param1:MapResource) : void
      {
         var _loc2_:String = Game.local ? "" : "resources/";
         this.var_3019 = param1.var_976;
         this.onLoadingComplete(param1);
      }
      
      public function get lights() : Vector.<Light3D>
      {
         return this.var_3023;
      }
      
      public function get objects() : Vector.<Object3D>
      {
         return this.var_199;
      }
      
      public function get name_2312() : Vector.<Object3D>
      {
         return this.var_3018;
      }
      
      public function get occluders() : Vector.<Occluder>
      {
         return this.var_3017;
      }
      
      public function get var_302() : Vector.<CollisionPrimitive>
      {
         return this.var_3015;
      }
      
      public function method_2819(param1:String) : Vector3D
      {
         var _loc2_:XMLList = this.var_3011.elements("ctf-flags").elements("flag-" + param1);
         if(_loc2_.length() == 0)
         {
            return null;
         }
         var _loc3_:Vector3D = new Vector3D();
         readVector3D(_loc2_,_loc3_);
         return _loc3_;
      }
      
      public function get method_2820() : Vector.<Object3D>
      {
         var _loc1_:XML = null;
         var _loc2_:Vector3D = null;
         var _loc3_:Vector3D = null;
         var _loc4_:Vector3D = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Plane = null;
         var _loc8_:Vector3D = null;
         var _loc9_:Box = null;
         var _loc10_:Triangle = null;
         if(this.var_3016 != null)
         {
            return this.var_3016;
         }
         this.var_3016 = new Vector.<Object3D>();
         var _loc11_:Vector.<Vector3D> = Vector.<Vector3D>([new Vector3D(),new Vector3D(),new Vector3D(1,1,1)]);
         var _loc12_:Matrix3D = new Matrix3D();
         for each(_loc1_ in this.var_3011.elements("collision-geometry").elements("collision-plane"))
         {
            _loc5_ = Number(_loc1_.width);
            _loc6_ = Number(_loc1_.length);
            _loc7_ = new Plane(_loc5_,_loc6_);
            readVector3D(_loc1_.position,_loc11_[0]);
            readVector3D(_loc1_.rotation,_loc11_[1]);
            _loc12_.recompose(_loc11_);
            _loc7_.matrix = _loc12_;
            this.var_3016.push(_loc7_);
         }
         for each(_loc1_ in this.var_3011.elements("collision-geometry").elements("collision-box"))
         {
            _loc8_ = _loc11_[0];
            readVector3D(_loc1_.size,_loc8_);
            _loc9_ = new Box(_loc8_.x,_loc8_.y,_loc8_.z);
            readVector3D(_loc1_.position,_loc11_[0]);
            readVector3D(_loc1_.rotation,_loc11_[1]);
            _loc12_.recompose(_loc11_);
            _loc9_.matrix = _loc12_;
            this.var_3016.push(_loc9_);
         }
         _loc2_ = new Vector3D();
         _loc3_ = new Vector3D();
         _loc4_ = new Vector3D();
         for each(_loc1_ in this.var_3011.elements("collision-geometry").elements("collision-triangle"))
         {
            readVector3D(_loc1_.v0,_loc2_);
            readVector3D(_loc1_.v1,_loc3_);
            readVector3D(_loc1_.v2,_loc4_);
            _loc10_ = new Triangle(_loc2_,_loc3_,_loc4_,false);
            readVector3D(_loc1_.position,_loc11_[0]);
            readVector3D(_loc1_.rotation,_loc11_[1]);
            _loc12_.recompose(_loc11_);
            _loc10_.matrix = _loc12_;
            this.var_3016.push(_loc10_);
         }
         return this.var_3016;
      }
      
      private function onLoadingComplete(param1:MapResource) : void
      {
         this.var_3011 = XML(param1.var_975.toString());
         Network(Main.osgi.getService(INetworker)).send("battle;" + "check_" + "m" + "d5" + "_map;" + MD5.name_3033(this.var_3011.toString()));
         this.loader = null;
         this.method_2812();
         this.var_3024.name_3034(this.var_1718);
         if(this.var_3012 != null)
         {
            (this.var_3012 as Mesh).calculateVerticesNormalsByAngle(Math.PI / 3,1);
         }
         this.method_2810();
         this.method_2809();
         this.method_2818();
         this.method_2813();
         this.method_2814();
         this.method_2817();
      }
      
      private function method_2814() : void
      {
         if(this.var_3012 == null)
         {
            return;
         }
         BSP(this.var_3012).alternativa3d::faces[0].material.alphaTestThreshold = 0.5;
      }
      
      private function method_2812() : void
      {
         var _loc1_:XML = null;
         this.var_3014 = new MaterialUsersRegistry();
         for each(_loc1_ in this.var_3011.elements("static-geometry").prop)
         {
            this.method_2458(_loc1_);
         }
      }
      
      private function method_2458(param1:XML) : void
      {
         var _loc2_:name_1682 = this.method_2816(param1);
         if(_loc2_ is PropMesh)
         {
            if(param1.@name == "Billboard")
            {
               this.method_2815(param1,PropMesh(_loc2_));
            }
            else
            {
               this.method_2459(param1,PropMesh(_loc2_));
            }
         }
         else if(_loc2_ is name_2677)
         {
            this.method_2460(param1,name_2677(_loc2_));
         }
      }
      
      private function method_2815(param1:XML, param2:PropMesh) : void
      {
         var _loc3_:Mesh = null;
         _loc3_ = Mesh(param2.object.clone());
         _loc3_.calculateFacesNormals();
         _loc3_.calculateVerticesNormalsByAngle(0);
         _loc3_.sorting = Sorting.DYNAMIC_BSP;
         _loc3_.name = name_1194.name_252;
         this.var_552.push(_loc3_);
         var _loc4_:String = method_2808(param1.elements("texture-name")[0],PropMesh.DEFAULT_TEXTURE);
         this.var_3014.addMesh(param2,_loc4_,new MeshWrapper(_loc3_,"display"),"display");
         var _loc5_:Vector3D = components[0];
         readVector3D(param1.position,_loc5_);
         this.var_3021.method_1663(_loc5_.x,_loc5_.y,_loc5_.z);
         var _loc6_:Vector3D = components[1];
         readVector3D(param1.rotation,_loc6_);
         _loc3_.x = _loc5_.x;
         _loc3_.y = _loc5_.y;
         _loc3_.z = _loc5_.z;
         _loc3_.rotationZ = _loc6_.z;
         this.var_199.push(_loc3_);
      }
      
      private function method_2816(param1:XML) : name_1682
      {
         var _loc2_:String = param1.attribute("library-name");
         var _loc3_:String = param1.attribute("group-name");
         var _loc4_:String = param1.@name;
         var _loc5_:PropLibrary = this.var_3019.method_1634(_loc2_);
         if(_loc5_ == null)
         {
            throw new Error("Library not found " + _loc2_);
         }
         var _loc6_:PropGroup = _loc5_.name_1683.method_2464(_loc3_);
         if(_loc6_ == null)
         {
            throw new Error("Group not found " + _loc3_ + " in library " + _loc2_);
         }
         var _loc7_:PropData = _loc6_.method_2465(_loc4_);
         if(_loc7_ == null)
         {
            throw new Error("Prop data not found " + _loc4_ + " in group " + _loc3_ + " in library " + _loc2_);
         }
         return _loc7_.name_1684().name_1685();
      }
      
      private function method_2459(param1:XML, param2:PropMesh) : void
      {
         var _loc4_:Occluder = null;
         var _loc5_:Matrix3D = null;
         var _loc6_:Occluder = null;
         var _loc7_:String = method_2808(param1.elements("texture-name")[0],PropMesh.DEFAULT_TEXTURE);
         if(_loc7_ == "invisible")
         {
            return;
         }
         var _loc8_:Vector3D = components[0];
         var _loc9_:Vector3D = components[1];
         var _loc10_:Mesh = Mesh(param2.object.clone());
         readVector3D(param1.position,_loc8_);
         _loc10_.x = _loc8_.x;
         _loc10_.y = _loc8_.y;
         _loc10_.z = _loc8_.z;
         this.var_3021.method_1663(_loc8_.x,_loc8_.y,_loc8_.z);
         readVector3D(param1.rotation,_loc9_);
         _loc10_.rotationZ = _loc9_.z;
         this.var_3022[_loc10_] = _loc7_;
         this.var_3020[_loc10_] = param2;
         this.var_1718.push(_loc10_);
         if(param2.occluders != null)
         {
            const_1829.recompose(components);
            for each(_loc4_ in param2.occluders)
            {
               _loc5_ = _loc4_.matrix;
               _loc5_.append(const_1829);
               _loc6_ = Occluder(_loc4_.clone());
               _loc6_.matrix = _loc5_;
               this.var_3017.push(_loc6_);
            }
         }
         if(param1.@name == "Elka")
         {
            this.var_3012 = _loc10_;
         }
      }
      
      private function method_2810() : void
      {
         var _loc1_:Mesh = null;
         var _loc2_:Object3D = null;
         var _loc3_:BSP = null;
         for each(_loc2_ in this.var_1718)
         {
            _loc1_ = Mesh(_loc2_);
            _loc3_ = new BSP();
            _loc3_.name = name_1194.name_252;
            _loc3_.createTree(_loc1_,true);
            _loc3_.x = _loc1_.x;
            _loc3_.y = _loc1_.y;
            _loc3_.z = _loc1_.z;
            _loc3_.rotationZ = _loc1_.rotationZ;
            this.var_3014.addBSP(this.var_3020[_loc1_],this.var_3022[_loc1_],new BSPWrapper(_loc3_));
            this.var_199.push(_loc3_);
            if(_loc1_ == this.var_3012)
            {
               this.var_3012 = _loc3_;
            }
         }
         this.var_1718.length = 0;
         clearDictionary(this.var_3022);
         clearDictionary(this.var_3020);
      }
      
      private function method_2460(param1:XML, param2:name_2677) : void
      {
         var _loc3_:Vector3D = null;
         var _loc4_:Sprite3D = Sprite3D(param2.object.clone());
         if(param1.@name.indexOf("Shar") != -1)
         {
            this.var_3013.push(_loc4_);
            _loc3_ = components[0];
            readVector3D(param1.position,_loc3_);
            _loc4_.x = _loc3_.x;
            _loc4_.y = _loc3_.y;
            _loc4_.z = _loc3_.z;
            _loc4_.name = param1.@name;
            return;
         }
         var _loc5_:Vector3D = components[0];
         readVector3D(param1.position,_loc5_);
         _loc4_.x = _loc5_.x;
         _loc4_.y = _loc5_.y;
         _loc4_.z = _loc5_.z;
         _loc4_.width = param2.scale;
         _loc4_.softAttenuation = 80;
         _loc4_.shadowMapAlphaThreshold = 0;
         this.var_3018.push(_loc4_);
         this.var_3014.addSprite3D(param2,new Sprite3DWrapper(_loc4_));
      }
      
      private function method_2817() : void
      {
         var _loc1_:Sprite3D = null;
         var _loc2_:name_1071 = null;
         var _loc3_:Vector3 = null;
         var _loc4_:ChristmasTreeToyEffect = null;
         if(this.var_3013.length < 1)
         {
            return;
         }
         var _loc5_:Vector3 = new Vector3();
         for each(_loc1_ in this.var_3013)
         {
            _loc5_.x += _loc1_.x;
            _loc5_.y += _loc1_.y;
            _loc5_.z += _loc1_.z;
         }
         _loc5_.x /= this.var_3013.length;
         _loc5_.y /= this.var_3013.length;
         _loc5_.z /= this.var_3013.length;
         for each(_loc1_ in this.var_3013)
         {
            _loc2_ = name_1071(this.var_11.getObjectPool().getObject(name_1071));
            _loc3_ = new Vector3(_loc1_.x,_loc1_.y,_loc1_.z);
            _loc2_.init(_loc3_,150);
            _loc4_ = ChristmasTreeToyEffect(this.var_11.getObjectPool().getObject(ChristmasTreeToyEffect));
            _loc4_.init(_loc1_,_loc2_,_loc5_);
            this.var_11.name_217(_loc4_);
         }
      }
      
      private function method_2813() : void
      {
         var _loc1_:Mesh = null;
         var _loc2_:Vector.<Mesh> = this.var_552;
         var _loc3_:BattleView3D = this.var_11.getBattlefieldData().viewport;
         for each(_loc1_ in _loc2_)
         {
            _loc3_.method_793(_loc1_);
         }
      }
      
      private function method_2809() : void
      {
         var _loc1_:Vector3 = null;
         var _loc2_:CollisionPrimitive = null;
         var _loc3_:XML = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Vector3 = null;
         this.var_3015 = new Vector.<CollisionPrimitive>();
         var _loc7_:Matrix3 = new Matrix3();
         var _loc8_:Vector3 = new Vector3();
         var _loc9_:Vector3 = new Vector3();
         _loc1_ = new Vector3();
         var _loc10_:XMLList = this.var_3011.elements("collision-geometry")[0].elements("collision-plane");
         for each(_loc3_ in _loc10_)
         {
            _loc8_.x = 0.5 * Number(_loc3_.width);
            _loc8_.y = 0.5 * Number(_loc3_.length);
            _loc8_.z = 0;
            readVector3(_loc3_.position,_loc9_);
            readVector3(_loc3_.rotation,_loc1_);
            _loc7_.name_932(_loc1_.x,_loc1_.y,_loc1_.z);
            _loc2_ = new name_2392(_loc8_,255,const_2292);
            _loc2_.transform.setFromMatrix3(_loc7_,_loc9_);
            this.var_3015.push(_loc2_);
         }
         _loc10_ = this.var_3011.elements("collision-geometry")[0].elements("collision-box");
         for each(_loc3_ in _loc10_)
         {
            readVector3(_loc3_.size,_loc8_);
            _loc8_.scale(0.5);
            readVector3(_loc3_.position,_loc9_);
            readVector3(_loc3_.rotation,_loc1_);
            _loc7_.name_932(_loc1_.x,_loc1_.y,_loc1_.z);
            _loc2_ = new name_904(_loc8_,255,const_2292);
            _loc2_.transform.setFromMatrix3(_loc7_,_loc9_);
            this.var_3015.push(_loc2_);
         }
         _loc4_ = new Vector3();
         _loc5_ = new Vector3();
         _loc6_ = new Vector3();
         _loc10_ = this.var_3011.elements("collision-geometry")[0].elements("collision-triangle");
         for each(_loc3_ in _loc10_)
         {
            readVector3(_loc3_.v0,_loc4_);
            readVector3(_loc3_.v1,_loc5_);
            readVector3(_loc3_.v2,_loc6_);
            if(!(method_2807(_loc4_) || method_2807(_loc5_) || method_2807(_loc6_)))
            {
               readVector3(_loc3_.position,_loc9_);
               readVector3(_loc3_.rotation,_loc1_);
               _loc7_.name_932(_loc1_.x,_loc1_.y,_loc1_.z);
               _loc2_ = new name_2398(_loc4_,_loc5_,_loc6_,255,const_2292);
               _loc2_.transform.setFromMatrix3(_loc7_,_loc9_);
               this.var_3015.push(_loc2_);
            }
         }
      }
      
      private function method_2818() : void
      {
         this.var_3010 = new BatchTextureBuilder();
         this.var_3010.addEventListener(Event.COMPLETE,this.method_763);
         this.var_3010.run(20,this.var_3014.meshEntries,this.var_3014.bspEntries,this.var_3014.spriteEntries);
      }
      
      private function method_763(param1:Event) : void
      {
         this.var_3010.removeEventListener(Event.COMPLETE,this.method_763);
         this.textures = this.var_3010.getTextures();
         this.var_3010 = null;
         this.complete();
      }
      
      private function complete() : void
      {
         this.var_3019.destroy();
         this.var_3019 = null;
         this.var_3014 = null;
         if(hasEventListener(Event.COMPLETE))
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      public function name_737() : name_767
      {
         return this.var_3021;
      }
      
      public function destroy() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:Mesh = null;
         var _loc3_:Sprite3D = null;
         var _loc4_:Occluder = null;
         if(this.var_3015 != null)
         {
            for each(_loc1_ in this.var_3015)
            {
               if(_loc1_ is name_2398)
               {
                  (_loc1_ as name_2398).destroy();
               }
               else if(_loc1_ is name_2392)
               {
                  (_loc1_ as name_2392).destroy();
               }
               else
               {
                  (_loc1_ as CollisionPrimitive).destroy();
               }
            }
            this.var_3015 = null;
         }
         if(this.var_1718 != null)
         {
            for each(_loc2_ in this.var_1718)
            {
               _loc2_ = null;
            }
            this.var_1718 = null;
         }
         if(this.var_3018 != null)
         {
            for each(_loc3_ in this.var_3018)
            {
               _loc3_ = null;
            }
            this.var_3018 = null;
         }
         if(this.var_3017 != null)
         {
            for each(_loc4_ in this.var_3017)
            {
               _loc4_ = null;
            }
            this.var_3017 = null;
         }
         if(this.var_552 != null)
         {
            for each(_loc2_ in this.var_552)
            {
               _loc2_ = null;
            }
            this.var_552 = null;
         }
         this.var_3012 = null;
         if(this.var_3010 != null)
         {
            this.var_3010.removeEventListener(Event.COMPLETE,this.method_763);
            this.var_3010.destroy();
            this.var_3010 = null;
         }
         this.method_2811();
      }
      
      private function method_2811() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.textures)
         {
            _loc1_.dispose();
            _loc2_++;
         }
         this.textures = null;
      }
   }
}

import alternativa.engine3d.materials.TextureMaterial;

interface IMaterialUser
{
    
   
   function setMaterial(param1:TextureMaterial) : void;
}

import alternativa.engine3d.materials.TextureMaterial;
import alternativa.engine3d.objects.Sprite3D;
import flash.display.BitmapData;

class Sprite3DWrapper implements IMaterialUser
{
    
   
   private var sprite:Sprite3D;
   
   public function Sprite3DWrapper(param1:Sprite3D)
   {
      super();
      this.sprite = param1;
   }
   
   public function setMaterial(param1:TextureMaterial) : void
   {
      var _loc2_:BitmapData = param1.texture;
      this.sprite.material = param1;
      var _loc3_:Number = Number(this.sprite.width);
      this.sprite.width = _loc3_ * _loc2_.width;
      this.sprite.height = _loc3_ * _loc2_.height;
      param1.resolution = this.sprite.calculateResolution(_loc2_.width,_loc2_.height);
   }
}

import alternativa.engine3d.materials.TextureMaterial;
import alternativa.engine3d.objects.BSP;

class BSPWrapper implements IMaterialUser
{
    
   
   private var bsp:BSP;
   
   public function BSPWrapper(param1:BSP)
   {
      super();
      this.bsp = param1;
   }
   
   public function setMaterial(param1:TextureMaterial) : void
   {
      this.bsp.setMaterialToAllFaces(param1);
   }
}

import alternativa.engine3d.core.Face;
import alternativa.engine3d.materials.TextureMaterial;
import alternativa.engine3d.objects.Mesh;

class MeshWrapper implements IMaterialUser
{
    
   
   private var mesh:Mesh;
   
   private var excludedMaterialName:String;
   
   public function MeshWrapper(param1:Mesh, param2:String)
   {
      super();
      this.mesh = param1;
      this.excludedMaterialName = param2;
   }
   
   public function setMaterial(param1:TextureMaterial) : void
   {
      var _loc2_:Face = null;
      for each(_loc2_ in this.mesh.faces)
      {
         if(Boolean(this.excludedMaterialName) && _loc2_.material.name != this.excludedMaterialName)
         {
            _loc2_.material = param1;
         }
      }
      this.mesh.removeVertex(this.mesh.addVertex(0,0,0));
   }
}

import package_352.PropMesh;
import package_352.name_2677;

class MaterialUsersRegistry
{
    
   
   public var meshEntries:Vector.<MeshMaterialUserEntry>;
   
   public var bspEntries:Vector.<BSPMaterialUserEntry>;
   
   public var spriteEntries:Vector.<Sprite3DMaterialUserEntry>;
   
   public function MaterialUsersRegistry()
   {
      this.meshEntries = new Vector.<MeshMaterialUserEntry>();
      this.bspEntries = new Vector.<BSPMaterialUserEntry>();
      this.spriteEntries = new Vector.<Sprite3DMaterialUserEntry>();
      super();
   }
   
   public function addMesh(param1:PropMesh, param2:String, param3:MeshWrapper, param4:String = null) : void
   {
      var _loc5_:MeshMaterialUserEntry = null;
      var _loc6_:MeshMaterialUserEntry = null;
      for each(_loc6_ in this.meshEntries)
      {
         if(_loc6_.propMesh == param1 && _loc6_.textureName == param2)
         {
            _loc5_ = _loc6_;
            break;
         }
      }
      if(_loc5_ == null)
      {
         _loc5_ = new MeshMaterialUserEntry(param1,param2,param4);
         this.meshEntries.push(_loc5_);
      }
      _loc5_.materialUsers.push(param3);
   }
   
   public function addBSP(param1:PropMesh, param2:String, param3:BSPWrapper) : void
   {
      var _loc4_:BSPMaterialUserEntry = null;
      var _loc5_:BSPMaterialUserEntry = null;
      for each(_loc5_ in this.bspEntries)
      {
         if(_loc5_.propMesh == param1 && _loc5_.textureName == param2)
         {
            _loc4_ = _loc5_;
            break;
         }
      }
      if(_loc4_ == null)
      {
         _loc4_ = new BSPMaterialUserEntry(param1,param2);
         this.bspEntries.push(_loc4_);
      }
      _loc4_.materialUsers.push(param3);
   }
   
   public function addSprite3D(param1:name_2677, param2:Sprite3DWrapper) : void
   {
      var _loc3_:Sprite3DMaterialUserEntry = null;
      var _loc4_:Sprite3DMaterialUserEntry = null;
      for each(_loc4_ in this.spriteEntries)
      {
         if(_loc4_.propSprite == param1)
         {
            _loc3_ = _loc4_;
            break;
         }
      }
      if(_loc3_ == null)
      {
         _loc3_ = new Sprite3DMaterialUserEntry(param1);
         this.spriteEntries.push(_loc3_);
      }
      _loc3_.materialUsers.push(param2);
   }
}

import package_303.TextureByteData;

class MaterialUserEntry
{
    
   
   public var materialUsers:Vector.<IMaterialUser>;
   
   public function MaterialUserEntry()
   {
      this.materialUsers = new Vector.<IMaterialUser>();
      super();
   }
   
   public function getTextureData() : TextureByteData
   {
      throw new Error("Not implemented");
   }
}

import package_303.TextureByteData;
import package_352.PropMesh;

class BSPMaterialUserEntry extends MaterialUserEntry
{
    
   
   public var propMesh:PropMesh;
   
   public var textureName:String;
   
   public function BSPMaterialUserEntry(param1:PropMesh, param2:String)
   {
      super();
      this.propMesh = param1;
      this.textureName = param2;
   }
   
   override public function getTextureData() : TextureByteData
   {
      return this.propMesh.textures.getValue(this.textureName);
   }
}

import package_303.TextureByteData;
import package_352.PropMesh;

class MeshMaterialUserEntry extends MaterialUserEntry
{
    
   
   public var propMesh:PropMesh;
   
   public var textureName:String;
   
   public var excludedMaterialName:String;
   
   public function MeshMaterialUserEntry(param1:PropMesh, param2:String, param3:String)
   {
      super();
      this.propMesh = param1;
      this.textureName = param2;
      this.excludedMaterialName = param3;
   }
   
   override public function getTextureData() : TextureByteData
   {
      return this.propMesh.textures.getValue(this.textureName);
   }
}

import package_303.TextureByteData;
import package_352.name_2677;

class Sprite3DMaterialUserEntry extends MaterialUserEntry
{
    
   
   public var propSprite:name_2677;
   
   public function Sprite3DMaterialUserEntry(param1:name_2677)
   {
      super();
      this.propSprite = param1;
   }
   
   override public function getTextureData() : TextureByteData
   {
      return this.propSprite.var_523;
   }
}

import alternativa.engine3d.core.MipMapping;
import alternativa.engine3d.materials.TextureMaterial;
import alternativa.tanks.engine3d.name_1076;
import alternativa.tanks.services.materialregistry.IMaterialRegistry;
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.EventDispatcher;
import package_1.Main;
import package_303.class_35;
import package_303.name_1206;
import package_303.TextureByteData;

class BatchTextureBuilder extends EventDispatcher implements class_35
{
    
   
   private var maxBatchSize:int;
   
   private var batchSize:int;
   
   private var firstBatchIndex:int;
   
   private var batchCouner:int;
   
   private var totalCounter:int;
   
   private var entries:Vector.<MaterialUserEntry>;
   
   private var constructors:Vector.<IndexedTextureConstructor>;
   
   private var textures:Vector.<BitmapData>;
   
   private var killed:Boolean;
   
   public function BatchTextureBuilder()
   {
      super();
      this.textures = new Vector.<BitmapData>();
   }
   
   public function destroy() : void
   {
      var _loc1_:BitmapData = null;
      this.killed = true;
      this.entries = null;
      this.constructors = null;
      for each(_loc1_ in this.textures)
      {
         _loc1_.dispose();
      }
      this.textures = null;
   }
   
   public function run(param1:int, param2:Vector.<MeshMaterialUserEntry>, param3:Vector.<BSPMaterialUserEntry>, param4:Vector.<Sprite3DMaterialUserEntry>) : void
   {
      var _loc5_:MeshMaterialUserEntry = null;
      var _loc6_:BSPMaterialUserEntry = null;
      var _loc7_:Sprite3DMaterialUserEntry = null;
      this.maxBatchSize = param1;
      this.constructors = new Vector.<IndexedTextureConstructor>(param1);
      var _loc8_:int = 0;
      while(_loc8_ < param1)
      {
         this.constructors[_loc8_] = new IndexedTextureConstructor();
         _loc8_++;
      }
      this.entries = new Vector.<MaterialUserEntry>();
      for each(_loc5_ in param2)
      {
         this.entries.push(_loc5_);
      }
      for each(_loc6_ in param3)
      {
         this.entries.push(_loc6_);
      }
      for each(_loc7_ in param4)
      {
         this.entries.push(_loc7_);
      }
      this.totalCounter = 0;
      this.firstBatchIndex = 0;
      this.createBatch();
   }
   
   public function onTextureReady(param1:name_1206) : void
   {
      var _loc4_:TextureMaterial = null;
      var _loc2_:IMaterialUser = null;
      var _loc3_:IndexedTextureConstructor = IndexedTextureConstructor(param1);
      if(this.killed)
      {
         _loc3_.disposeTexture();
      }
      else
      {
         this.textures.push(_loc3_.texture);
         _loc4_ = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry)).textureMaterialRegistry.getMaterial(name_1076.const_1698,_loc3_.texture,MipMapping.PER_PIXEL);
         for each(_loc2_ in this.entries[_loc3_.index].materialUsers)
         {
            _loc2_.setMaterial(_loc4_);
         }
         ++this.totalCounter;
         ++this.batchCouner;
         if(this.totalCounter == this.entries.length)
         {
            this.complete();
         }
         else if(this.batchCouner == this.batchSize)
         {
            this.createBatch();
         }
      }
   }
   
   private function createBatch() : void
   {
      var _loc1_:IndexedTextureConstructor = null;
      var _loc2_:TextureByteData = null;
      this.batchCouner = 0;
      var _loc3_:int = this.firstBatchIndex + this.maxBatchSize;
      if(_loc3_ > this.entries.length)
      {
         _loc3_ = int(this.entries.length);
      }
      this.batchSize = _loc3_ - this.firstBatchIndex;
      var _loc4_:int = 0;
      while(_loc4_ < this.batchSize)
      {
         _loc1_ = this.constructors[_loc4_];
         _loc1_.index = this.firstBatchIndex + _loc4_;
         _loc2_ = this.entries[_loc1_.index].getTextureData();
         _loc1_.createTexture(_loc2_,this);
         _loc4_++;
      }
      this.firstBatchIndex = _loc3_;
   }
   
   private function complete() : void
   {
      this.constructors = null;
      this.entries = null;
      dispatchEvent(new Event(Event.COMPLETE));
   }
   
   public function getTextures() : Vector.<BitmapData>
   {
      return this.textures;
   }
}

import package_303.name_1206;

class IndexedTextureConstructor extends name_1206
{
    
   
   public var index:int;
   
   public function IndexedTextureConstructor()
   {
      super();
   }
   
   public function disposeTexture() : void
   {
      if(texture != null)
      {
         texture.dispose();
      }
   }
}
