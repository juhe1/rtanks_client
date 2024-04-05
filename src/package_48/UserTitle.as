package package_48
{
   import alternativa.engine3d.core.Clipping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.models.battlefield.gui.chat.name_1135;
   import alternativa.tanks.utils.name_75;
   import controls.Label;
   import controls.base.name_1134;
   import filters.name_1131;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import flash.text.GridFitType;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getTimer;
   import forms.name_1139;
   import package_297.name_1138;
   import package_37.Vector3;
   import package_47.BattleTeamType;
   import package_49.name_163;
   import package_68.name_175;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.name_70;
   
   public class UserTitle implements AutoClosable
   {
      
      private static const const_135:int = 10000;
      
      private static const const_137:int = 3000;
      
      private static const const_138:Number = 0;
      
      private static const const_148:Number = 135;
      
      private static const matrix:Matrix = new Matrix();
      
      private static const const_145:int = 13;
      
      private static const const_141:int = 3;
      
      private static const const_143:int = 0;
      
      private static const const_129:int = 18;
      
      private static const const_140:int = 13;
      
      private static const const_139:int = 11;
      
      private static const const_132:int = 7;
      
      private static const const_131:int = 10;
      
      private static const const_136:int = 18;
      
      private static const const_134:int = 2;
      
      private static const const_150:int = 2;
      
      private static const const_128:int = -1;
      
      private static const const_142:int = 4;
      
      private static const const_130:int = 4;
      
      private static const const_146:int = 100;
      
      private static const const_149:int = 8;
      
      private static const const_133:int = 3;
      
      private static const const_144:int = 6;
      
      private static const const_126:SmallRankIcon = new SmallRankIcon();
      
      private static const const_127:Vector.<int> = Vector.<int>([name_163.name_196,name_163.ARMOR,name_163.name_474,name_163.NITRO]);
      
      public static const const_147:Number = 0.002;
      
      public static var var_447:Boolean = false;
       
      
      private var var_442:int;
      
      private var var_444:int;
      
      private var sprite:Sprite3D;
      
      private var var_453:Rectangle;
      
      private var label:Label;
      
      private var var_441:name_1129;
      
      private var var_452:name_1129;
      
      private var var_438:Vector.<EffectIndicator>;
      
      private var var_446:int;
      
      private var var_454:int;
      
      private var rankId:int;
      
      private var var_451:String;
      
      private var health:int;
      
      private var var_449:int;
      
      private var var_448:Boolean;
      
      private var teamType:BattleTeamType;
      
      private var var_439:name_1128;
      
      private var var_455:Boolean;
      
      private var hidden:Boolean = true;
      
      private var time:int;
      
      private var material:TextureMaterial;
      
      private var texture:BitmapData;
      
      private var zOffset:Number;
      
      private var var_170:name_175;
      
      private var var_443:Label;
      
      private var size:name_1133;
      
      private var var_456:int;
      
      private var isLocal:Boolean;
      
      private var var_445:Boolean;
      
      private var var_440:int;
      
      private var var_437:name_1132;
      
      private var var_450:name_70;
      
      public function UserTitle(param1:Boolean, param2:name_70 = null)
      {
         this.teamType = BattleTeamType.NONE;
         super();
         if(param1)
         {
            this.zOffset = 0;
         }
         else
         {
            this.zOffset = 135;
         }
         this.teamType = BattleTeamType.NONE;
         this.var_439 = name_1128.name_1143;
         this.var_443 = new name_1134();
         this.size = new name_1133();
         this.isLocal = param1;
         this.material = new TextureMaterial();
         this.material.uploadEveryFrame = true;
         this.sprite = new Sprite3D(100,100,this.material);
         this.sprite.clipping = Clipping.FACE_CLIPPING;
         this.sprite.perspectiveScale = false;
         this.sprite.alpha = 0;
         this.sprite.visible = false;
         this.sprite.useShadowMap = false;
         this.sprite.useLight = false;
         this.var_450 = param2;
         if(!param1)
         {
            this.sprite.originY = 1;
            this.var_437 = new name_1132();
         }
         else
         {
            this.sprite.depthTest = false;
         }
         this.hidden = true;
      }
      
      private function method_657(param1:uint) : void
      {
         if(!this.isLocal)
         {
            this.var_437.name_1136(param1,this.var_450,this.sprite.height);
         }
      }
      
      public function name_239() : void
      {
         if(!this.isLocal)
         {
            this.var_437.name_1136(this.var_439.color,this.var_450,this.sprite.height);
         }
      }
      
      public function method_670() : BitmapData
      {
         return this.texture;
      }
      
      public function hide() : void
      {
         if(this.hidden)
         {
            return;
         }
         this.hidden = true;
      }
      
      public function show() : void
      {
         if(!this.hidden)
         {
            return;
         }
         this.hidden = false;
      }
      
      public function name_885() : Boolean
      {
         return this.hidden;
      }
      
      public function name_207(param1:int) : void
      {
         if(this.var_442 != param1)
         {
            this.var_442 = param1;
            this.method_84();
         }
      }
      
      private function method_84() : void
      {
         this.method_655(name_92.EFFECTS | name_92.name_262 | name_92.WEAPON);
         this.var_448 = true;
         this.method_661();
      }
      
      public function setResistance(param1:int) : void
      {
         if(this.var_440 != param1)
         {
            this.var_440 = param1;
            this.var_443.text = param1.toString();
            this.method_654();
         }
      }
      
      public function getResistance() : int
      {
         return this.var_440;
      }
      
      public function name_227(param1:BattleTeamType) : void
      {
         var _loc2_:name_1128 = null;
         if(this.teamType != param1)
         {
            this.teamType = param1;
            _loc2_ = name_1128.name_1148(param1);
            if(this.var_439.color != _loc2_.color)
            {
               this.method_657(_loc2_.color);
            }
            this.var_439 = _loc2_;
            this.method_655(name_92.const_68 | name_92.name_262 | name_92.WEAPON);
         }
      }
      
      public function name_122(param1:int) : void
      {
         if(this.rankId != param1)
         {
            this.rankId = param1;
            if(this.method_653(name_92.const_68))
            {
               this.method_654();
            }
         }
      }
      
      private function method_654() : void
      {
         this.method_655(name_92.const_68 | name_92.name_262 | name_92.WEAPON | name_92.EFFECTS);
      }
      
      private function method_655(param1:int) : void
      {
         this.var_444 |= param1;
      }
      
      public function name_971(param1:Boolean) : void
      {
         if(this.var_445 != param1)
         {
            this.var_445 = param1;
            if(this.method_653(name_92.const_68))
            {
               this.method_654();
            }
         }
      }
      
      public function name_156(param1:String) : void
      {
         if(this.var_451 != param1)
         {
            this.var_451 = param1;
            if(this.method_653(name_92.const_68))
            {
               this.method_661();
               this.method_654();
            }
         }
      }
      
      public function name_133(param1:int) : void
      {
         if(this.health == param1)
         {
            return;
         }
         this.health = param1;
         if(this.method_653(name_92.name_262))
         {
            this.method_655(name_92.name_262);
         }
      }
      
      public function name_159(param1:int) : void
      {
         if(this.var_449 != param1)
         {
            this.var_449 = param1;
            this.method_655(name_92.WEAPON);
         }
      }
      
      public function name_157(param1:int, param2:int) : void
      {
         var _loc3_:EffectIndicator = null;
         if(this.method_653(name_92.EFFECTS))
         {
            _loc3_ = this.method_660(param1);
            if(_loc3_ != null)
            {
               if(_loc3_.name_885())
               {
                  this.method_659(1);
               }
               _loc3_.show(param2);
            }
         }
      }
      
      public function name_254(param1:int) : void
      {
         var _loc2_:EffectIndicator = null;
         if(this.method_653(name_92.EFFECTS))
         {
            _loc2_ = this.method_660(param1);
            if(_loc2_ != null)
            {
               _loc2_.hide();
            }
         }
      }
      
      public function name_256() : void
      {
         var _loc1_:int = 0;
         if(this.method_653(name_92.EFFECTS) && this.var_438 != null)
         {
            for each(_loc1_ in const_127)
            {
               this.name_254(_loc1_);
            }
         }
      }
      
      internal function method_672(param1:EffectIndicator) : void
      {
         param1.clear(this.texture);
         this.method_659(-1);
      }
      
      public function update(param1:Vector3) : void
      {
         var _loc2_:EffectIndicator = null;
         this.name_731(param1);
         var _loc3_:int = getTimer();
         var _loc4_:int = _loc3_ - this.time;
         this.time = _loc3_;
         this.method_668(_loc4_);
         if(this.var_444 != 0)
         {
            if(this.method_656(name_92.const_68))
            {
               this.method_664();
            }
            if(this.method_656(name_92.name_262))
            {
               this.var_441.name_1146(this.var_439);
               this.var_441.progress = this.health;
               this.var_441.draw(this.texture);
            }
            if(this.method_656(name_92.WEAPON))
            {
               this.var_452.progress = this.var_449;
               this.var_452.draw(this.texture);
            }
            if(this.method_656(name_92.EFFECTS))
            {
               for each(_loc2_ in this.var_438)
               {
                  _loc2_.name_1144();
               }
            }
            this.var_444 = 0;
         }
         if(this.method_653(name_92.EFFECTS))
         {
            this.method_667(_loc3_,_loc4_);
            if(this.var_441 != null && this.method_653(name_92.name_262))
            {
               this.var_441.draw(this.texture);
            }
         }
      }
      
      private function method_671(param1:int) : Boolean
      {
         return (param1 & this.var_444 & this.var_442) != 0;
      }
      
      private function method_656(param1:int) : Boolean
      {
         return (param1 & this.var_444 & this.var_442) != 0;
      }
      
      private function method_667(param1:int, param2:int) : void
      {
         var _loc3_:EffectIndicator = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = int(this.var_438.length);
         if(this.var_448)
         {
            this.var_448 = false;
            _loc5_ = this.size.width + 6 - this.var_446 * 18 - (this.var_446 - 1) * 4 >> 1;
            _loc4_ = 0;
            while(_loc4_ < _loc6_)
            {
               _loc3_ = this.var_438[_loc4_];
               if(_loc3_.method_213())
               {
                  _loc3_.clear(this.texture);
               }
               if(!_loc3_.name_885())
               {
                  _loc3_.name_731(_loc5_,this.var_454);
                  _loc5_ += 18 + 4;
               }
               _loc4_++;
            }
            this.method_655(name_92.name_262);
         }
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc3_ = this.var_438[_loc4_];
            _loc3_.update(param1,param2,this.texture,this.material);
            _loc4_++;
         }
      }
      
      private function method_659(param1:int) : void
      {
         this.var_446 += param1;
         this.var_448 = true;
      }
      
      private function method_661() : void
      {
         if(this.var_442 != 0)
         {
            this.method_666();
            this.method_665();
         }
      }
      
      private function method_666() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.size.name_1150();
         if(this.method_653(name_92.const_68))
         {
            this.method_669();
            this.label.text = this.var_451 || "";
            this.var_443.color = name_1135.name_1140;
            this.var_443.filters = name_1131.name_1147;
            this.size.name_1152(18 + 2 + this.label.textWidth + 7 + 11 + 10);
            this.size.name_1142(13);
         }
         if(this.method_653(name_92.name_262))
         {
            this.size.name_1137(100);
            if(this.method_653(name_92.const_68))
            {
               this.size.name_1130(2);
            }
            this.size.name_1130(8);
            if(this.method_653(name_92.WEAPON))
            {
               this.size.name_1130(-1 + 8);
            }
         }
         if(this.method_653(name_92.EFFECTS))
         {
            _loc1_ = 4;
            _loc2_ = _loc1_ * 18 + (_loc1_ - 1) * 4;
            this.size.name_1137(_loc2_);
            if(this.method_653(name_92.const_68 | name_92.name_262))
            {
               this.size.name_1130(4);
            }
            this.size.name_1130(18);
         }
         this.size.name_1153(2 * 3);
         this.size.name_1130(2 * 3);
         this.createTexture();
         this.method_657(this.var_439.color);
      }
      
      private function createTexture() : void
      {
         var _loc1_:int = Math.ceil(this.size.width);
         var _loc2_:int = Math.ceil(this.size.height);
         var _loc3_:int = name_75.method_615(this.size.width);
         var _loc4_:int = name_75.method_615(this.size.height);
         var _loc5_:Boolean = false;
         if(this.texture == null || this.texture.width != _loc3_ || this.texture.height != _loc4_)
         {
            if(this.texture != null)
            {
               this.texture.dispose();
            }
            this.texture = new BitmapData(_loc3_,_loc4_,true,0);
            this.material.texture = this.texture;
            this.var_453 = this.texture.rect;
            _loc5_ = true;
         }
         if(_loc5_ || _loc1_ != this.sprite.width || _loc2_ != this.sprite.height)
         {
            this.sprite.width = _loc1_;
            this.sprite.height = _loc2_;
            this.sprite.bottomRightU = _loc1_ / _loc3_;
            this.sprite.bottomRightV = _loc2_ / _loc4_;
            this.method_654();
         }
      }
      
      private function method_665() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 3;
         if(this.method_653(name_92.const_68))
         {
            _loc2_ += 13;
         }
         if(this.method_653(name_92.name_262))
         {
            if(this.method_653(name_92.const_68))
            {
               _loc2_ += 2;
            }
            _loc1_ = this.size.width - 100 >> 1;
            this.var_441 = new name_1129(_loc1_,_loc2_,10000,100,this.var_439);
            _loc2_ += 8;
            if(this.method_653(name_92.WEAPON))
            {
               _loc2_ += -1;
               this.var_452 = new name_1129(_loc1_,_loc2_,100,100,name_1128.name_1149);
               _loc2_ += 8;
            }
         }
         if(this.method_653(name_92.EFFECTS))
         {
            _loc2_ += 4;
            this.var_454 = _loc2_;
            this.method_662();
         }
      }
      
      public function name_742(param1:name_175) : void
      {
         if(this.sprite.parent != null)
         {
            return;
         }
         param1.addChild(this.sprite);
         if(this.var_437 != null)
         {
            param1.addChild(this.var_437);
         }
         this.time = getTimer();
      }
      
      public function name_775() : void
      {
         if(this.sprite.parent != null)
         {
            this.sprite.parent.removeChild(this.sprite);
         }
         if(this.var_437 != null)
         {
            if(this.var_437.parent != null)
            {
               this.var_437.parent.removeChild(this.var_437);
            }
         }
      }
      
      public function name_731(param1:Vector3) : void
      {
         this.sprite.x = param1.x;
         this.sprite.y = param1.y;
         this.sprite.z = param1.z + this.zOffset;
         if(!this.isLocal)
         {
            this.var_437.x = this.sprite.x;
            this.var_437.y = this.sprite.y;
            this.var_437.z = this.sprite.z;
         }
      }
      
      public function name_962(param1:Vector3D) : void
      {
         param1.x = this.sprite.x;
         param1.y = this.sprite.y;
         param1.z = this.sprite.z;
      }
      
      public function name_249(param1:Boolean) : void
      {
         this.var_455 = param1;
         this.method_654();
      }
      
      public function method_653(param1:int) : Boolean
      {
         return (param1 & this.var_442) != 0;
      }
      
      private function method_669() : void
      {
         if(this.label == null)
         {
            this.label = new Label();
            this.label.gridFitType = GridFitType.PIXEL;
            this.label.autoSize = TextFieldAutoSize.LEFT;
            this.label.thickness = 200;
         }
      }
      
      private function method_664() : void
      {
         var _loc1_:BitmapData = this.texture.clone();
         _loc1_.fillRect(this.var_453,0);
         var _loc2_:int = this.method_658() + 2 + this.label.textWidth;
         if(this.var_440 > 0)
         {
            _loc2_ += 7 + Math.max(11,this.var_443.textWidth);
         }
         var _loc3_:int = this.size.width - _loc2_ >> 1;
         matrix.tx = _loc3_;
         matrix.ty = 3 + this.method_663();
         const_126.init(this.var_445,this.rankId);
         _loc1_.draw(const_126,matrix,null,null,null,true);
         matrix.tx = _loc3_ + this.method_658() + 2;
         matrix.ty = 3;
         this.label.textColor = this.var_455 ? uint(name_1139.name_1151) : uint(this.var_439.color);
         _loc1_.draw(this.label,matrix,null,null,null,true);
         if(this.var_440 > 0)
         {
            matrix.tx += 7 + this.label.textWidth;
            matrix.ty = 3 + 4;
            _loc1_.draw(name_1138.name_1145(this.teamType),matrix,null,null,null,true);
         }
         this.texture.applyFilter(_loc1_,this.var_453,new Point(),name_1131.name_1141);
         if(this.var_440 > 0)
         {
            matrix.tx += 3;
            matrix.ty = 3;
            this.texture.draw(this.var_443,matrix,null,null,null,true);
         }
         _loc1_.dispose();
      }
      
      private function method_662() : void
      {
         var _loc1_:int = 0;
         if(this.var_438 == null)
         {
            this.var_438 = new Vector.<EffectIndicator>();
            for each(_loc1_ in const_127)
            {
               if(_loc1_ == name_163.name_196)
               {
                  this.var_438.push(new EffectIndicator(_loc1_,100000,this,300,0));
               }
               else
               {
                  this.var_438.push(new EffectIndicator(_loc1_,3000,this,300,30));
               }
            }
         }
      }
      
      private function method_660(param1:int) : EffectIndicator
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:EffectIndicator = null;
         if(this.var_438 != null)
         {
            _loc2_ = int(this.var_438.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.var_438[_loc3_];
               if(_loc4_.effectId == param1)
               {
                  return _loc4_;
               }
               _loc3_++;
            }
         }
         return null;
      }
      
      private function method_668(param1:int) : void
      {
         if(this.hidden)
         {
            if(this.sprite.alpha > 0)
            {
               this.sprite.alpha -= 0.002 * param1;
               if(this.sprite.alpha <= 0)
               {
                  this.sprite.alpha = 0;
                  this.sprite.visible = false;
               }
            }
         }
         else
         {
            this.sprite.visible = true;
            if(this.sprite.alpha < 1)
            {
               this.sprite.alpha += 0.002 * param1;
               if(this.sprite.alpha > 1)
               {
                  this.sprite.alpha = 1;
               }
            }
         }
         if(this.var_437 != null)
         {
            if(this.sprite.visible && var_447)
            {
               this.var_437.visible = true;
               if(this.var_437.alpha < 1)
               {
                  this.var_437.alpha += 0.002 * param1 * 2.3;
               }
            }
            else if(this.var_437.alpha > 0)
            {
               this.var_437.alpha -= 0.002 * param1 * 2.3;
            }
            if(this.sprite.alpha < this.var_437.alpha)
            {
               this.var_437.alpha = this.sprite.alpha;
            }
            if(!this.sprite.visible)
            {
               this.var_437.visible = false;
               this.var_437.alpha = 0;
            }
         }
      }
      
      private function method_658() : int
      {
         return this.var_445 ? int(18) : int(13);
      }
      
      private function method_663() : int
      {
         return this.var_445 ? int(0) : int(3);
      }
      
      public function close() : void
      {
         if(this.var_437 != null)
         {
            this.var_437.dispose();
            this.var_437 = null;
         }
         if(this.material != null)
         {
            this.material.dispose();
            this.material = null;
         }
         if(this.texture != null)
         {
            this.texture.dispose();
            this.texture = null;
         }
         if(this.sprite != null)
         {
            this.sprite.material = null;
         }
         this.sprite = null;
      }
   }
}
