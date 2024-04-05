package package_48
{
   import alternativa.engine3d.core.Clipping;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import controls.Label;
   import filters.name_1131;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.GridFitType;
   import flash.text.TextFieldAutoSize;
   import package_343.ResistancesIcons;
   import package_51.name_90;
   import package_58.name_112;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1132 extends Sprite3D
   {
      
      private static const matrix:Matrix = new Matrix();
      
      private static const label:Label = new Label();
      
      private static const ZERO:Point = new Point();
      
      private static var var_1927:Number;
      
      private static var var_1926:Number;
      
      {
         label.autoSize = TextFieldAutoSize.LEFT;
         label.thickness = 200;
         label.gridFitType = GridFitType.PIXEL;
      }
      
      private var texture:BitmapData;
      
      public function name_1132()
      {
         this.texture = new BitmapData(256,180,true,0);
         var _loc1_:TextureMaterial = new TextureMaterial(this.texture);
         _loc1_.uploadEveryFrame = true;
         super(256,180,_loc1_);
         perspectiveScale = false;
         alpha = 1;
         visible = true;
         useShadowMap = false;
         useLight = false;
         originY = 1;
         clipping = Clipping.FACE_CULLING;
         sorting = Sorting.AVERAGE_Z;
      }
      
      public static function createTexture(param1:String, param2:Vector.<name_90>) : BitmapData
      {
         var _loc3_:* = undefined;
         var_1927 = 0;
         var _loc4_:BitmapData = new BitmapData(256,180,true,0);
         var _loc5_:int = 2;
         if(param2.length != 0)
         {
            method_2071(22,_loc5_,param2,_loc4_);
         }
         _loc5_ += 40;
         method_2072(22,_loc5_,param1,_loc4_);
         _loc5_ += 15;
         var_1926 = _loc5_;
         _loc4_.applyFilter(_loc4_,_loc4_.rect,ZERO,name_1131.name_1141);
         return _loc4_;
      }
      
      private static function method_2072(param1:int, param2:int, param3:String, param4:BitmapData) : void
      {
         label.text = param3;
         matrix.tx = param1 + 25;
         matrix.ty = param2;
         param4.draw(label,matrix,null,null,null,true);
         matrix.tx += label.width + 10;
         var_1927 = Math.max(var_1927,matrix.tx + label.width + 2);
      }
      
      private static function method_2071(param1:int, param2:int, param3:Vector.<name_90>, param4:BitmapData) : void
      {
         var _loc5_:name_90 = null;
         var _loc6_:BitmapData = null;
         var _loc7_:BitmapData = null;
         var _loc8_:Number = NaN;
         var _loc9_:Label = null;
         var _loc10_:Number = NaN;
         matrix.tx = param1 + ((3 - param3.length) * ResistancesIcons.name_2360.width >> 1);
         matrix.ty = param2;
         for each(_loc5_ in param3)
         {
            _loc6_ = ResistancesIcons.name_2360;
            param4.draw(_loc6_,matrix,null,null,null,true);
            _loc7_ = ResistancesIcons.name_2096(_loc5_.resistanceProperty);
            _loc8_ = _loc6_.height - _loc7_.height >> 1;
            matrix.tx += _loc6_.width - _loc7_.width >> 1;
            matrix.ty += _loc8_;
            param4.draw(_loc7_,matrix,null,null,null,true);
            _loc9_ = new Label();
            _loc9_.text = _loc5_.resistanceInPercent == 100 ? "??" : _loc5_.resistanceInPercent.toString() + "%";
            matrix.ty += _loc6_.height - 3;
            _loc10_ = _loc6_.width - _loc9_.textWidth + 2 >> 1;
            matrix.tx += _loc10_;
            param4.draw(_loc9_,matrix,null,null,null,true);
            matrix.tx += _loc6_.width + 3 - _loc10_;
            matrix.ty -= _loc8_ + _loc6_.height - 3;
         }
      }
      
      public function name_1136(param1:uint, param2:name_70, param3:int) : void
      {
         var _loc4_:String = "R: " + Math.floor(Math.random() * 10000);
         var _loc5_:name_112 = name_112(param2.name_176(name_112));
         var _loc6_:Vector.<name_90> = _loc5_.method_501();
         if(_loc6_ == null)
         {
            return;
         }
         label.color = param1;
         var _loc7_:BitmapData = createTexture(_loc4_,_loc6_);
         this.method_2073();
         this.texture.draw(_loc7_);
         _loc7_.dispose();
         var _loc8_:Number = Math.max(32 * _loc6_.length + 4,var_1927);
         width = _loc8_;
         var_1926 += param3;
         height = var_1926;
         bottomRightU = _loc8_ / this.texture.width;
         bottomRightV = var_1926 / this.texture.height;
      }
      
      private function method_2073() : *
      {
         this.texture.dispose();
         this.texture = new BitmapData(256,180,true,0);
         material = new TextureMaterial(this.texture);
         material.uploadEveryFrame = true;
      }
      
      public function dispose() : void
      {
         if(material != null)
         {
            material.dispose();
         }
         if(this.texture != null)
         {
            this.texture.dispose();
         }
         this.texture = null;
         material = null;
      }
   }
}
