package alternativa.tanks.models.dom.hud
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.models.battlefield.BattleView3D;
   import alternativa.tanks.services.materialregistry.name_100;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import forms.battlelist.BattleMode;
   import package_311.name_1307;
   import package_311.name_1312;
   import package_312.name_1311;
   import package_37.Vector3;
   import package_47.BattleTeamType;
   import package_74.name_272;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class KeyPointView
   {
      
      public static var lightingEffectsService:name_272;
      
      public static var var_58:TextureMaterialRegistry = name_100(OSGi.getInstance().name_6(name_100)).textureMaterialRegistry as TextureMaterialRegistry;
      
      public static const const_413:Number = 1000;
      
      public static const const_416:Number = 350;
      
      private static const const_414:Number = 100;
      
      private static const const_415:Number = 1.5;
       
      
      private var pedestal:BSP;
      
      private var var_617:TextureMaterial;
      
      private var var_614:TextureMaterial;
      
      private var var_615:TextureMaterial;
      
      private var var_616:TextureMaterial;
      
      private var var_610:ProgressPlane;
      
      private var var_609:OmniLight;
      
      private var var_612:name_1307;
      
      private var var_613:name_1307;
      
      private var var_611:name_1307;
      
      public function KeyPointView(param1:String, param2:BattleView3D, param3:name_1311)
      {
         super();
         this.pedestal = method_815(param3.pedestal);
         this.var_615 = var_58.getMaterial(null,param3.bluePedestalTexture.data,2);
         this.var_614 = var_58.getMaterial(null,param3.redPedestalTexture.data,2);
         this.var_616 = var_58.getMaterial(null,param3.neutralPedestalTexture.data,2);
         var _loc4_:name_1312 = lightingEffectsService.name_1313(BattleMode.CP);
         this.var_612 = _loc4_.name_1310(BattleTeamType.RED);
         this.var_613 = _loc4_.name_1310(BattleTeamType.BLUE);
         this.var_611 = _loc4_.name_1310(BattleTeamType.NONE);
         this.method_843(param1,param3);
         this.method_841(_loc4_);
         param2.method_787(this.var_610);
         param2.method_787(this.pedestal);
      }
      
      private static function method_815(param1:Tanks3DSResource) : BSP
      {
         var _loc2_:Mesh = Mesh(param1.objects[0]);
         var _loc3_:BSP = new BSP();
         _loc3_.createTree(_loc2_);
         return _loc3_;
      }
      
      private static function method_833(param1:BitmapData) : TextureMaterial
      {
         var _loc2_:TextureMaterial = null;
         _loc2_ = var_58.getMaterial(null,param1,2,false);
         _loc2_.resolution = 1000 / param1.width;
         return _loc2_;
      }
      
      private static function method_838(param1:BitmapData, param2:BitmapData, param3:int) : Matrix
      {
         var _loc4_:int = param2.height;
         var _loc5_:Matrix = new Matrix();
         _loc5_.tx = (param1.height - _loc4_) / 2 - _loc4_ * param3;
         _loc5_.ty = (param1.height - _loc4_) / 2;
         return _loc5_;
      }
      
      private static function method_840(param1:BitmapData, param2:BitmapData) : Rectangle
      {
         var _loc3_:int = param2.height;
         var _loc4_:Number = (param1.height - _loc3_) / 2;
         return new Rectangle(_loc4_,_loc4_,_loc3_,_loc3_);
      }
      
      private static function method_836(param1:BitmapData, param2:BitmapData) : BitmapData
      {
         var _loc3_:BitmapData = param1.clone();
         _loc3_.copyChannel(param2,param2.rect,new Point(),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
         return _loc3_;
      }
      
      private static function method_834(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 + (param2 - param1) * param3;
      }
      
      private static function method_839(param1:uint, param2:uint, param3:Number) : uint
      {
         var _loc4_:Number = (param1 >> 16 & 255) / 255;
         var _loc5_:Number = (param1 >> 8 & 255) / 255;
         var _loc6_:Number = (param1 & 255) / 255;
         var _loc7_:Number = (param2 >> 16 & 255) / 255;
         var _loc8_:Number = (param2 >> 8 & 255) / 255;
         var _loc9_:Number = (param2 & 255) / 255;
         var _loc10_:int = method_834(_loc4_,_loc7_,param3) * 255;
         var _loc11_:int = method_834(_loc5_,_loc8_,param3) * 255;
         var _loc12_:int = method_834(_loc6_,_loc9_,param3) * 255;
         return _loc10_ << 16 | _loc11_ << 8 | _loc12_;
      }
      
      private function method_841(param1:name_1312) : void
      {
         this.var_609 = new OmniLight(0,param1.name_1314(),param1.name_1316());
         this.method_835(this.var_611);
      }
      
      private function method_843(param1:String, param2:name_1311) : void
      {
         var _loc3_:BitmapData = param2.neutralCircle.data.clone();
         var _loc4_:BitmapData = param2.blueCircle.data.clone();
         var _loc5_:BitmapData = param2.redCircle.data.clone();
         var _loc6_:BitmapData = param2.bigLetters.data;
         var _loc7_:int = param1.charCodeAt(0) - "A".charCodeAt(0);
         var _loc8_:Rectangle = method_840(_loc3_,_loc6_);
         var _loc9_:Matrix = method_838(_loc3_,_loc6_,_loc7_);
         _loc3_.draw(_loc6_,_loc9_,null,BlendMode.NORMAL,_loc8_,true);
         _loc4_.draw(_loc6_,_loc9_,null,BlendMode.NORMAL,_loc8_,true);
         _loc5_.draw(_loc6_,_loc9_,null,BlendMode.NORMAL,_loc8_,true);
         var _loc10_:BitmapData = method_836(_loc4_,_loc3_);
         var _loc11_:BitmapData = method_836(_loc5_,_loc3_);
         var _loc12_:TextureMaterial = method_833(_loc3_);
         var _loc13_:TextureMaterial = method_833(_loc4_);
         var _loc14_:TextureMaterial = method_833(_loc10_);
         var _loc15_:TextureMaterial = method_833(_loc5_);
         var _loc16_:TextureMaterial = method_833(_loc11_);
         this.var_610 = new ProgressPlane(1000,1000,_loc12_,_loc14_,_loc13_,_loc16_,_loc15_);
      }
      
      public function update(param1:Number, param2:Camera3D) : void
      {
         this.var_610.method_284(param1);
         this.var_610.name_1315(param2);
         this.method_842(param1 / 100);
      }
      
      public function method_845(param1:BattleView3D, param2:Vector3) : void
      {
         this.pedestal.x = param2.x;
         this.pedestal.y = param2.y;
         this.pedestal.z = param2.z;
         param1.name_884(this.pedestal);
         this.var_610.x = param2.x;
         this.var_610.y = param2.y;
         this.var_610.z = param2.z + 350;
         param1.name_884(this.var_610);
         this.var_609.x = param2.x;
         this.var_609.y = param2.y;
         this.var_609.z = param2.z + 350;
         param1.name_884(this.var_609);
      }
      
      public function method_847() : void
      {
         this.method_837(this.var_614);
         this.method_835(this.var_612);
      }
      
      public function method_848() : void
      {
         this.method_837(this.var_615);
         this.method_835(this.var_613);
      }
      
      public function method_846() : void
      {
         this.method_837(this.var_616);
         this.method_835(this.var_611);
      }
      
      private function method_837(param1:TextureMaterial) : void
      {
         if(this.var_617 != param1)
         {
            this.var_617 = param1;
            this.pedestal.setMaterialToAllFaces(param1);
         }
      }
      
      private function method_835(param1:name_1307) : void
      {
         this.var_609.color = param1.name_1308();
         this.var_609.intensity = param1.name_1309();
      }
      
      private function method_842(param1:Number) : void
      {
         var _loc2_:uint = param1 < 0 ? uint(this.var_612.name_1308()) : uint(this.var_613.name_1308());
         var _loc3_:Number = param1 < 0 ? Number(this.var_612.name_1309()) : Number(this.var_613.name_1309());
         this.var_609.color = method_839(this.var_611.name_1308(),_loc2_,Math.pow(Math.abs(param1),1.5));
         this.var_609.intensity = method_834(this.var_611.name_1309(),_loc3_,Math.pow(Math.abs(param1),1.5));
      }
      
      public function method_844(param1:Boolean) : void
      {
         this.var_610.visible = param1;
         this.var_609.visible = param1;
      }
   }
}
