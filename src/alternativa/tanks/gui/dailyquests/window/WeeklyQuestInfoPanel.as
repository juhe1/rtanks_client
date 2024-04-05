package alternativa.tanks.gui.dailyquests.window
{
   import alternativa.osgi.OSGi;
   import controls.base.name_1134;
   import controls.name_1891;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.TextEvent;
   import flash.geom.Matrix;
   import package_126.name_338;
   import package_402.ShowWeeklyQuestRewardEvent;
   import package_469.name_3306;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class WeeklyQuestInfoPanel extends Sprite
   {
      
      private static const const_2603:Class = name_3307;
      
      private static const const_2604:Class = name_3308;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      private static const const_2605:int = 570;
      
      public static const const_1532:int = 50;
      
      private static const const_2607:int = 7;
      
      private static const SPACE:int = 5;
      
      private static const const_2608:int = 5;
      
      private static const const_2606:int = 44;
       
      
      private var var_3358:Bitmap;
      
      private var var_3361:Bitmap;
      
      private var var_3363:name_1891;
      
      private var var_3360:Bitmap;
      
      private var var_3359:Bitmap;
      
      private var var_3362:name_1134;
      
      private var currentQuestStreak:int;
      
      private var var_3364:Boolean;
      
      private var questImage:Bitmap;
      
      private var rewardImage:Bitmap;
      
      private var var_3365:name_3306;
      
      private var var_2538:int;
      
      public function WeeklyQuestInfoPanel()
      {
         this.var_3358 = new Bitmap(new const_2603().bitmapData);
         this.var_3361 = new Bitmap(new const_2604().bitmapData);
         this.var_3360 = new Bitmap();
         this.var_3359 = new Bitmap();
         this.var_3362 = new name_1134();
         this.questImage = new Bitmap();
         this.rewardImage = new Bitmap();
         this.var_3365 = new name_3306(0.3,0.6);
         super();
      }
      
      public function init(param1:name_338) : void
      {
         this.currentQuestStreak = param1.currentQuestStreak;
         this.var_3364 = param1.doneForToday;
         this.method_3035(param1);
      }
      
      private function method_3035(param1:name_338) : void
      {
         this.questImage.bitmapData = param1.questImage;
         this.questImage.x = 0;
         this.questImage.y = 5 + 1;
         addChild(this.questImage);
         this.rewardImage.bitmapData = param1.rewardImage;
         this.rewardImage.x = this.var_2538 - 5;
         this.rewardImage.y = 5 + 1;
         addChild(this.rewardImage);
      }
      
      public function method_1791(param1:int) : void
      {
         this.var_2538 = param1 - 2 * 44 - 2 * 5;
         this.method_3033();
      }
      
      public function name_2862(param1:int) : void
      {
         if(!this.var_3364)
         {
            ++this.currentQuestStreak;
            this.var_3364 = true;
         }
         this.method_1791(param1);
      }
      
      private function method_3033() : void
      {
         this.method_3034();
         this.method_3030();
         this.method_3032();
         this.method_3031();
      }
      
      private function method_3031() : void
      {
         this.var_3362.visible = this.var_2538 > 570;
      }
      
      private function method_3034() : void
      {
         this.rewardImage.x = this.var_2538 + 44 + 2 * 5;
      }
      
      private function method_3030() : void
      {
         if(this.var_3363 == null)
         {
            this.var_3363 = new name_1891(this.var_2538,50,name_1891.name_1428);
            this.var_3363.x = 44 + 5;
            this.var_3363.y = 5;
            addChild(this.var_3363);
            this.var_3360.x = 44 + 5 + 1;
            this.var_3360.y = 5 + 1;
            this.var_3360.blendMode = BlendMode.OVERLAY;
            addChild(this.var_3360);
            this.var_3359.y = 5 + 1;
            this.var_3359.blendMode = BlendMode.OVERLAY;
            addChild(this.var_3359);
            this.var_3362.x = 44 + 5 + 5;
            this.var_3362.y = 4 * 5;
            this.var_3362.htmlText = localeService.getText(name_390.const_820);
            this.var_3362.addEventListener(TextEvent.LINK,this.method_3036);
            addChild(this.var_3362);
         }
         this.var_3363.width = this.var_2538;
      }
      
      private function method_3036(param1:TextEvent) : void
      {
         dispatchEvent(new ShowWeeklyQuestRewardEvent());
      }
      
      private function method_3032() : void
      {
         var _loc1_:Shape = null;
         var _loc2_:Graphics = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Shape = null;
         var _loc6_:Graphics = null;
         this.var_3365.stop();
         var _loc7_:Number = this.var_2538 * 1 / 7;
         var _loc8_:int = _loc7_ * this.currentQuestStreak;
         if(this.currentQuestStreak != 0)
         {
            this.var_3360.bitmapData = new BitmapData(_loc8_,this.var_3358.height,true,0);
            this.var_3360.bitmapData.draw(this.var_3358);
            if(_loc8_ > this.var_3358.width)
            {
               this.var_3361.width = Math.min(_loc8_ - this.var_3358.width,this.var_2538 - this.var_3358.width * 2) - 2;
               _loc1_ = new Shape();
               _loc2_ = _loc1_.graphics;
               _loc2_.beginBitmapFill(this.var_3361.bitmapData);
               _loc2_.drawRect(this.var_3358.width,0,this.var_3361.width,this.var_3361.height);
               _loc2_.endFill();
               this.var_3360.bitmapData.draw(_loc1_);
            }
            if(this.currentQuestStreak == 7)
            {
               this.var_3360.bitmapData.draw(this.var_3358,new Matrix(-1,0,0,1,this.var_2538 - 2,0));
            }
         }
         if(!this.var_3364)
         {
            _loc3_ = _loc7_;
            _loc4_ = 0;
            this.var_3359.bitmapData = new BitmapData(this.var_2538 - _loc8_,this.var_3358.height,true,0);
            if(this.currentQuestStreak == 0)
            {
               this.var_3359.bitmapData.draw(this.var_3358);
               _loc3_ = _loc7_ - this.var_3358.width;
               _loc4_ = this.var_3358.width;
            }
            if(this.currentQuestStreak == 6)
            {
               this.var_3359.bitmapData.draw(this.var_3358,new Matrix(-1,0,0,1,this.var_2538 - _loc8_,0));
               _loc3_ = this.var_2538 - _loc8_ - this.var_3358.width;
            }
            this.var_3361.width = _loc3_;
            _loc5_ = new Shape();
            _loc6_ = _loc5_.graphics;
            _loc6_.beginBitmapFill(this.var_3361.bitmapData);
            _loc6_.drawRect(_loc4_,0,this.var_3361.width,this.var_3361.height);
            _loc6_.endFill();
            this.var_3359.bitmapData.draw(_loc5_);
            this.var_3359.x = this.var_3360.x + this.var_3360.width - (this.currentQuestStreak == 0 ? 0 : 2);
            this.var_3365.start(this.var_3359);
         }
         else
         {
            this.var_3359.visible = false;
         }
      }
   }
}
