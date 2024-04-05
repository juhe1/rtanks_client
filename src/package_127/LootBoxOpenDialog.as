package package_127
{
   import alternativa.osgi.OSGi;
   import controls.base.name_1134;
   import controls.base.name_998;
   import controls.name_1891;
   import controls.name_1922;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import package_110.name_331;
   import package_110.name_382;
   import package_379.class_123;
   import package_54.name_102;
   import platform.client.fp10.core.resource.BatchResourceLoader;
   import platform.client.fp10.core.resource.Resource;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class LootBoxOpenDialog extends class_123
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      private static const const_1953:Class = name_2642;
      
      private static const const_1948:BitmapData = new const_1953().bitmapData;
      
      private static const const_1951:Class = name_2648;
      
      private static const const_1967:BitmapData = new const_1951().bitmapData;
      
      private static const const_1968:Class = name_2646;
      
      private static const const_1961:BitmapData = new const_1968().bitmapData;
      
      private static const const_1955:Class = name_2651;
      
      private static const const_1957:BitmapData = new const_1955().bitmapData;
      
      private static const const_1952:Class = name_2650;
      
      private static const const_1950:BitmapData = new const_1952().bitmapData;
      
      private static const const_1969:Class = name_2643;
      
      private static const const_1946:BitmapData = new const_1969().bitmapData;
      
      private static const const_1958:Class = name_2640;
      
      private static const const_1966:BitmapData = new const_1958().bitmapData;
      
      private static const const_1960:Class = name_2644;
      
      private static const const_1956:BitmapData = new const_1960().bitmapData;
      
      private static const const_1959:Class = name_2641;
      
      private static const const_1947:BitmapData = new const_1959().bitmapData;
      
      private static const const_1949:Class = name_2639;
      
      private static const const_1945:BitmapData = new const_1949().bitmapData;
      
      private static const const_1965:Class = name_2647;
      
      private static const const_1964:BitmapData = new const_1965().bitmapData;
      
      private static const const_1970:Class = name_2649;
      
      private static const const_1954:BitmapData = new const_1970().bitmapData;
      
      private static const const_1963:Class = name_2645;
      
      private static const const_1962:BitmapData = new const_1963().bitmapData;
      
      private static const const_1973:int = 0;
      
      private static const const_1974:int = 1;
      
      private static const const_1981:int = 2;
      
      private static const const_1980:int = 3;
      
      private static const const_1978:int = 4;
      
      private static const const_1972:int = 5;
      
      private static const const_1979:int = 6;
      
      private static const const_1989:int = 7;
      
      private static const const_1971:Number = 0.5833333333333334;
      
      private static const const_1984:Number = 0.5833333333333334;
      
      private static const const_1987:Number = 0.25;
      
      private static const const_1982:Number = 0.3333333333333333;
      
      private static const const_1985:Number = 1;
      
      private static const const_1988:Number = 1.1666666666666667;
      
      private static const const_1986:Number = 0.5;
      
      private static const const_1983:Number = 0.16666666666666666;
      
      private static const const_1990:Number = 0.25;
      
      private static const const_1975:Number = 0.9166666666666666;
      
      private static const const_1977:Number = 1;
      
      private static const const_1518:int = 625;
      
      private static const const_1519:int = 591;
      
      private static const const_1976:int = 54;
      
      private static const const_422:int = 11;
       
      
      private var var_2369:int = 0;
      
      private var name_983:name_998;
      
      private var var_2368:Sprite;
      
      private var params:name_382;
      
      private var window:name_1922;
      
      private var var_1182:name_1891;
      
      private var rewards:Vector.<name_331>;
      
      private var var_2367:Array;
      
      private var index:int = 0;
      
      private var color:ColorTransform;
      
      private var var_2366:Sprite;
      
      private var var_2365:Sprite;
      
      private var var_2363:Sprite;
      
      private var shine1:Sprite;
      
      private var shine2:Sprite;
      
      private var dust:Dust;
      
      private var stars:Stars;
      
      private var present:Sprite;
      
      private var label:name_1134;
      
      private var var_2364:name_1134;
      
      private var timer:int = 0;
      
      private var state:int = 0;
      
      public function LootBoxOpenDialog(param1:name_382, param2:int)
      {
         this.name_983 = new name_998();
         this.var_2368 = new Sprite();
         this.window = new name_1922(625,591);
         this.rewards = new Vector.<name_331>();
         this.var_2367 = [];
         this.color = new ColorTransform();
         this.var_2366 = new Sprite();
         this.var_2365 = new Sprite();
         this.var_2363 = new Sprite();
         this.shine1 = new Sprite();
         this.shine2 = new Sprite();
         this.dust = new Dust(const_1964,16,625 - 100,591 - 40);
         this.stars = new Stars(const_1954,const_1962,16,625 / 2 - 80);
         this.present = new Sprite();
         this.label = new name_1134();
         this.var_2364 = new name_1134();
         super();
         this.params = param1;
         this.var_2369 = param2;
         addChild(this.window);
         this.method_2389();
      }
      
      public function name_1584(param1:Vector.<name_331>) : void
      {
         var resources:Vector.<Resource>;
         var reward:name_331 = null;
         var rewards:Vector.<name_331> = param1;
         this.rewards = rewards.concat();
         resources = new Vector.<Resource>();
         for each(reward in rewards)
         {
            if(!reward.image.isLoaded && resources.indexOf(reward.image) < 0)
            {
               resources.push(reward.image);
            }
         }
         if(resources.length > 0)
         {
            new BatchResourceLoader(function():void
            {
               startOpeningBox();
            }).load(resources);
         }
         else
         {
            this.startOpeningBox();
         }
      }
      
      public function name_1879(param1:int) : void
      {
         if(param1 == 0)
         {
            this.var_2366.getChildAt(0).visible = true;
            this.var_2366.getChildAt(1).visible = false;
            this.var_2366.getChildAt(2).visible = false;
            this.var_2365.getChildAt(0).visible = true;
            this.var_2365.getChildAt(1).visible = false;
            this.var_2365.getChildAt(2).visible = false;
            this.var_2363.getChildAt(0).visible = true;
            this.var_2363.getChildAt(1).visible = false;
            this.var_2363.getChildAt(2).visible = false;
         }
         else if(param1 == 1)
         {
            this.var_2366.getChildAt(0).visible = false;
            this.var_2366.getChildAt(1).visible = true;
            this.var_2366.getChildAt(2).visible = false;
            this.var_2365.getChildAt(0).visible = false;
            this.var_2365.getChildAt(1).visible = true;
            this.var_2365.getChildAt(2).visible = false;
            this.var_2363.getChildAt(0).visible = false;
            this.var_2363.getChildAt(1).visible = true;
            this.var_2363.getChildAt(2).visible = false;
         }
         else if(param1 == 2)
         {
            this.var_2366.getChildAt(0).visible = false;
            this.var_2366.getChildAt(1).visible = false;
            this.var_2366.getChildAt(2).visible = true;
            this.var_2365.getChildAt(0).visible = false;
            this.var_2365.getChildAt(1).visible = false;
            this.var_2365.getChildAt(2).visible = true;
            this.var_2363.getChildAt(0).visible = false;
            this.var_2363.getChildAt(1).visible = false;
            this.var_2363.getChildAt(2).visible = true;
         }
      }
      
      private function startOpeningBox() : void
      {
         var _loc1_:name_331 = null;
         var _loc2_:Present = null;
         for each(_loc1_ in this.rewards)
         {
            _loc2_ = new Present(_loc1_.image.data,_loc1_.name,_loc1_.category);
            this.var_2367.push(_loc2_);
         }
         this.name_1332((this.var_2367[0] as Present).color);
         this.state = 1;
         this.var_1182.addChild(this.var_2365);
         this.var_1182.addChild(this.var_2363);
         this.var_1182.addChild(this.dust);
         this.var_1182.addChild(this.stars);
         this.var_1182.addChild(this.present);
         this.timer = getTimer();
         this.dust.alpha = 0;
         this.var_2363.alpha = 0;
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame,false,0,true);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Present = null;
         var _loc5_:Number = (getTimer() - this.timer) / 1000;
         var _loc6_:Present = this.var_2367[this.index];
         var _loc7_:Present = this.var_2367[this.index + 1] as Present;
         var _loc8_:int = 1;
         var _loc9_:int = this.index - 1;
         while(_loc9_ >= 0)
         {
            _loc4_ = this.var_2367[_loc9_];
            if(_loc4_.bitmap.bitmapData != _loc6_.bitmap.bitmapData)
            {
               break;
            }
            _loc8_++;
            _loc9_--;
         }
         this.var_2364.alpha = _loc8_ > 1 && this.state == 5 ? Number(1) : Number(0);
         this.var_2364.text = "x" + _loc8_.toString();
         this.var_2364.x = -this.var_2364.width / 2;
         if(this.state == 6)
         {
            if(_loc5_ < 0.16666666666666666)
            {
               _loc2_ = _loc5_ / 0.16666666666666666;
               _loc2_ = Math.pow(_loc2_,1 / 3);
               _loc3_ = 0.35 + (0.65 + 0.1) * _loc2_;
               this.var_2364.alpha = _loc2_;
               this.var_2364.scaleX = _loc3_;
               this.var_2364.scaleY = _loc3_;
            }
            else if(_loc5_ < 0.25)
            {
               _loc2_ = 1 - (_loc5_ - 0.16666666666666666) / (0.25 - 0.16666666666666666);
               _loc3_ = 1 + 0.1 * _loc2_;
               this.var_2364.alpha = 1;
               this.var_2364.scaleX = _loc3_;
               this.var_2364.scaleY = _loc3_;
            }
            else if(_loc5_ < 0.9166666666666666)
            {
               this.var_2364.alpha = 1;
               this.var_2364.scaleX = 1;
               this.var_2364.scaleY = 1;
            }
            else if(_loc5_ < 1)
            {
               if(this.index < this.var_2367.length - 1)
               {
                  _loc2_ = 1 - (_loc5_ - 0.9166666666666666) / (1 - 0.9166666666666666);
                  this.var_2364.alpha = _loc2_;
               }
               else
               {
                  this.timer = getTimer();
                  this.state = 5;
               }
            }
            else
            {
               this.var_2364.alpha = 0;
               if(_loc7_ != null && _loc6_.bitmap.bitmapData != _loc7_.bitmap.bitmapData)
               {
                  this.present.removeChildren();
                  this.state = 4;
               }
               else if(_loc7_ == null)
               {
                  this.state = 5;
               }
               else
               {
                  ++this.index;
               }
               this.timer = getTimer();
            }
         }
         else if(this.state == 1)
         {
            _loc2_ = _loc5_ / 0.5833333333333334;
            if(_loc2_ < 1)
            {
               this.var_2365.alpha = _loc2_;
            }
            else
            {
               this.var_2365.alpha = 1;
               this.var_1182.removeChild(this.var_2366);
               this.timer = getTimer();
               this.state = 7;
            }
         }
         else if(this.state == 7)
         {
            _loc2_ = _loc5_ / 0.5833333333333334;
            if(_loc2_ < 1)
            {
               this.var_2363.alpha = _loc2_;
               this.dust.alpha = _loc2_;
            }
            else
            {
               this.var_2363.alpha = 1;
               this.dust.alpha = 1;
               this.timer = getTimer();
               this.state = 2;
            }
         }
         else if(this.state == 2)
         {
            if(_loc5_ > _loc6_.delay)
            {
               this.present.addChild(_loc6_.bitmap);
               this.present.addChild(this.label);
               this.present.addChild(this.var_2364);
               this.label.text = _loc6_.name;
               this.label.x = -this.label.width / 2;
               _loc6_.bitmap.x = -_loc6_.bitmap.width / 2;
               _loc6_.bitmap.y = -_loc6_.bitmap.height / 2;
               this.present.alpha = 0;
               this.timer = getTimer();
               this.state = 3;
            }
         }
         else if(this.state == 3)
         {
            if(_loc5_ < 0.25)
            {
               _loc2_ = _loc5_ / 0.25;
               _loc2_ = Math.pow(_loc2_,1 / 3);
               _loc3_ = 0.35 + (0.65 + 0.1) * _loc2_;
               this.present.alpha = _loc2_;
               this.present.scaleX = _loc3_;
               this.present.scaleY = _loc3_;
            }
            else if(_loc5_ < 0.3333333333333333)
            {
               this.var_1182.addChild(this.shine1);
               this.var_1182.addChild(this.shine2);
               this.var_1182.addChild(this.dust);
               this.var_1182.addChild(this.stars);
               this.var_1182.addChild(this.present);
               this.dust.alpha = 1;
               this.stars.alpha = 1;
               _loc2_ = 1 - (_loc5_ - 0.25) / (0.3333333333333333 - 0.25);
               _loc3_ = 1 + 0.1 * _loc2_;
               this.present.alpha = 1;
               this.present.scaleX = _loc3_;
               this.present.scaleY = _loc3_;
            }
            else if(_loc5_ < 1)
            {
               this.present.alpha = 1;
               this.present.scaleX = 1;
               this.present.scaleY = 1;
            }
            else if(_loc5_ < 1.1666666666666667)
            {
               if(this.index < this.var_2367.length - 1)
               {
                  if(_loc6_.bitmap.bitmapData != _loc7_.bitmap.bitmapData)
                  {
                     _loc2_ = 1 - (_loc5_ - 1) / (1.1666666666666667 - 1);
                     this.present.alpha = _loc2_;
                  }
               }
               else
               {
                  this.timer = getTimer();
                  this.state = 5;
               }
            }
            else
            {
               if(_loc7_ != null && _loc7_.bitmap.bitmapData == _loc6_.bitmap.bitmapData)
               {
                  this.state = 6;
                  ++this.index;
               }
               else
               {
                  this.state = 4;
                  this.present.alpha = 0;
                  this.present.removeChild(_loc6_.bitmap);
               }
               this.timer = getTimer();
            }
         }
         else if(this.state == 4)
         {
            if(_loc5_ < 0.5)
            {
               _loc2_ = _loc5_ / 0.5;
               this.interpolate(_loc6_.color,_loc7_.color,_loc2_);
               this.name_1332(this.color);
            }
            else
            {
               this.name_1332(_loc7_.color);
               ++this.index;
               this.timer = getTimer();
               this.state = 2;
            }
         }
         else if(this.state == 5)
         {
            this.window.addChild(this.name_983);
         }
         this.shine1.rotation += 0.3;
         this.shine2.rotation -= 0.3;
         this.dust.update();
         this.stars.update();
      }
      
      private function method_2389() : void
      {
         var _loc1_:int = 0;
         var _loc2_:name_2638 = null;
         var _loc3_:int = 625 - 2 * 11;
         var _loc4_:int = 591 - 2 * 11 - 54 - 5;
         this.var_1182 = new name_1891(_loc3_,_loc4_,name_1891.name_1428);
         this.var_1182.x = 11;
         this.var_1182.y = 11;
         this.window.addChild(this.var_1182);
         this.name_983.label = localeService.getText(name_390.const_1168);
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_2391,false,0,true);
         this.name_983.x = 625 - this.name_983.width - 11;
         this.name_983.y = 591 - this.name_983.height - 11;
         this.var_2368.y = 591 - 2 * 11 - 54 + 15;
         this.window.addChild(this.name_983);
         this.window.addChild(this.var_2368);
         var _loc5_:Array = [1,5,15];
         var _loc6_:Array = [localeService.getText(name_390.TEXT_LOOT_1_OPEN_BUTTON),localeService.getText(name_390.TEXT_LOOT_2_OPEN_BUTTON),localeService.getText(name_390.TEXT_LOOT_3_OPEN_BUTTON)];
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < _loc5_.length)
         {
            _loc1_ = int(_loc5_[_loc8_]);
            _loc2_ = new name_2638(_loc6_[_loc8_],_loc1_,_loc8_);
            _loc2_.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
            _loc2_.addEventListener(MouseEvent.CLICK,this.method_2390,false,0,true);
            _loc2_.x = _loc7_;
            this.var_2368.addChild(_loc2_);
            _loc7_ += 135;
            _loc2_.enabled = _loc1_ <= this.var_2369;
            _loc8_++;
         }
         this.var_2368.x = (625 - _loc7_) / 2;
         this.var_2366.addChild(new Bitmap(const_1948));
         this.var_2366.addChild(new Bitmap(const_1967));
         this.var_2366.addChild(new Bitmap(const_1961));
         this.var_1182.addChild(this.var_2366);
         this.var_2365.addChild(new Bitmap(const_1957));
         this.var_2365.addChild(new Bitmap(const_1950));
         this.var_2365.addChild(new Bitmap(const_1946));
         this.var_2365.alpha = 0;
         this.var_2363.addChild(new Bitmap(const_1966));
         this.var_2363.addChild(new Bitmap(const_1956));
         this.var_2363.addChild(new Bitmap(const_1947));
         this.var_2363.blendMode = BlendMode.ADD;
         this.var_2363.alpha = 0;
         this.var_2366.width = _loc3_;
         this.var_2366.height = _loc4_;
         this.var_2365.width = _loc3_;
         this.var_2365.height = _loc4_;
         this.var_2363.width = _loc3_;
         this.var_2363.height = _loc4_;
         this.shine1.addChild(new Bitmap(const_1945,PixelSnapping.NEVER,true));
         this.shine1.getChildAt(0).x = -this.shine1.getChildAt(0).width / 2;
         this.shine1.getChildAt(0).y = -this.shine1.getChildAt(0).height / 2;
         this.shine1.x = 625 / 2;
         this.shine1.y = 591 / 2;
         this.shine1.width = 410;
         this.shine1.height = 410;
         this.shine1.blendMode = BlendMode.ADD;
         this.shine2.addChild(new Bitmap(const_1945,PixelSnapping.NEVER,true));
         this.shine2.getChildAt(0).x = -this.shine1.getChildAt(0).width / 2;
         this.shine2.getChildAt(0).y = -this.shine1.getChildAt(0).height / 2;
         this.shine2.x = 625 / 2;
         this.shine2.y = 591 / 2;
         this.shine2.width = 410;
         this.shine2.height = 410;
         this.shine2.blendMode = BlendMode.ADD;
         this.dust.x = 50;
         this.dust.y = 20;
         this.dust.alpha = 0;
         this.stars.x = 625 / 2;
         this.stars.y = 591 / 2;
         this.stars.alpha = 0;
         this.present.x = 625 / 2;
         this.present.y = 591 / 2;
         this.present.alpha = 0;
         var _loc9_:TextFormat = new TextFormat();
         _loc9_.align = "center";
         this.label.autoSize = TextFieldAutoSize.CENTER;
         this.label.defaultTextFormat = _loc9_;
         this.label.size = 40;
         this.label.x = -(_loc3_ - 100) / 2;
         this.label.y = 591 / 6;
         this.var_2364.autoSize = TextFieldAutoSize.CENTER;
         this.var_2364.defaultTextFormat = _loc9_;
         this.var_2364.size = 40;
         this.var_2364.y = 591 / 6 + 40;
         this.var_2364.alpha = 0;
         this.name_1879(0);
      }
      
      private function interpolate(param1:ColorTransform, param2:ColorTransform, param3:Number) : void
      {
         this.color.redMultiplier = param1.redMultiplier + (param2.redMultiplier - param1.redMultiplier) * param3;
         this.color.greenMultiplier = param1.greenMultiplier + (param2.greenMultiplier - param1.greenMultiplier) * param3;
         this.color.blueMultiplier = param1.blueMultiplier + (param2.blueMultiplier - param1.blueMultiplier) * param3;
      }
      
      private function name_1332(param1:ColorTransform) : void
      {
         this.var_2363.transform.colorTransform = param1;
         this.shine1.transform.colorTransform = param1;
         this.shine2.transform.colorTransform = param1;
         this.dust.transform.colorTransform = param1;
         this.stars.name_1332(param1);
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         var _loc2_:name_2638 = param1.target as name_2638;
         this.name_1879(_loc2_.mode);
      }
      
      private function method_2390(param1:MouseEvent) : void
      {
         var _loc2_:name_2638 = param1.target as name_2638;
         this.window.removeChild(this.var_2368);
         this.window.removeChild(this.name_983);
         this.var_2369 -= _loc2_.count;
         dispatchEvent(new name_1582(_loc2_.count));
      }
      
      private function close() : void
      {
         var_864.name_1013(this);
      }
      
      private function method_2391(param1:MouseEvent) : void
      {
         this.close();
      }
      
      override protected function method_1319() : void
      {
         if(this.window.contains(this.name_983))
         {
            this.close();
         }
      }
      
      override protected function method_1320() : void
      {
         if(this.window.contains(this.name_983))
         {
            this.close();
         }
      }
   }
}
