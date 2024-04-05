package package_479
{
   import controls.name_2873;
   import controls.slider.name_3350;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class name_3460 extends name_2873
   {
       
      
      private var var_2930:int = 1;
      
      private var var_2935:int = 1;
      
      private var var_3692:int = 0;
      
      private var var_3691:int = 0;
      
      private var var_3687:int = 1;
      
      private var var_3689:int = 2;
      
      private var var_3688:SelectRankThumbSlider;
      
      protected var var_3690:Number;
      
      public function name_3460()
      {
         this.var_3688 = new SelectRankThumbSlider();
         super();
         removeChild(track);
         track = new name_3350(false);
         addChild(track);
         removeChild(thumb);
         addChild(this.var_3688);
         var_3395 = 36;
      }
      
      override protected function method_3064(param1:Event) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_1057);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_3062);
      }
      
      override protected function method_2068(param1:Event) : void
      {
         this.var_3688.name_3638.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.var_3688.name_3639.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.var_3688.name_3637.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      override protected function onMouseDown(param1:MouseEvent) : void
      {
         super.onMouseDown(param1);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.method_1057);
         this.var_3692 = this.var_2930;
         this.var_3691 = this.var_2935;
      }
      
      public function get minRang() : int
      {
         return this.var_2930;
      }
      
      public function set minRang(param1:int) : void
      {
         this.var_2930 = param1;
         this.method_3295();
         this.method_3293();
      }
      
      public function get maxRang() : int
      {
         return this.var_2935;
      }
      
      public function set maxRang(param1:int) : void
      {
         this.var_2935 = param1;
         this.method_3294();
         this.method_3293();
      }
      
      public function get currentRang() : int
      {
         return this.var_3687;
      }
      
      public function set currentRang(param1:int) : void
      {
         this.var_3687 = param1;
         value = this.var_2930 = this.var_2935 = this.var_3687;
         this.method_3293();
      }
      
      protected function method_3295() : void
      {
         if(this.var_2930 < var_3393)
         {
            this.var_2930 = var_3393;
         }
         else if(this.var_2930 < this.var_3687 - this.var_3689)
         {
            this.var_2930 = this.var_3687 - this.var_3689;
            this.var_2935 = this.var_3687;
         }
         else if(this.var_2930 < this.var_2935 - this.var_3689)
         {
            this.var_2935 = this.var_2930 + this.var_3689;
         }
         else if(this.var_2930 > this.var_3687)
         {
            this.var_2930 = this.var_3687;
         }
      }
      
      protected function method_3294() : void
      {
         if(this.var_2935 > var_3394)
         {
            this.var_2935 = var_3394;
         }
         else if(this.var_2935 > this.var_3687 + this.var_3689)
         {
            this.var_2935 = this.var_3687 + this.var_3689;
            this.var_2930 = this.var_3687;
         }
         else if(this.var_2935 > this.var_2930 + this.var_3689)
         {
            this.var_2930 = this.var_2935 - this.var_3689;
         }
         else if(this.var_2935 < this.var_3687)
         {
            this.var_2935 = this.var_3687;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         var _loc2_:int = var_3394 - var_3393;
         this.var_3690 = (_width + 2 - var_3395) / _loc2_;
         this.method_3293();
      }
      
      override protected function method_1057(param1:MouseEvent) : void
      {
         if(param1 != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_3062);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_1057);
            if(this.var_3691 != this.var_2930 || this.var_3691 != this.var_2935)
            {
               dispatchEvent(new name_3459());
            }
         }
      }
      
      override protected function method_3062(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = var_3397.mouseX < var_3398;
         var _loc3_:Boolean = var_3397.mouseX > var_3398;
         var _loc4_:Boolean = this.var_2930 < this.var_3687;
         var _loc5_:Boolean = this.var_2935 > this.var_3687;
         var _loc6_:int = 0;
         if(var_3397 == this.var_3688.name_3638 && (_loc2_ || _loc4_))
         {
            this.var_2930 += int((this.var_3688.name_3638.mouseX - var_3398) / this.var_3690);
            this.method_3295();
            this.method_3294();
         }
         else if(var_3397 == this.var_3688.name_3639 && (_loc3_ || _loc5_))
         {
            this.var_2935 += int((this.var_3688.name_3639.mouseX - var_3398) / this.var_3690);
            this.method_3295();
            this.method_3294();
         }
         else if(var_3397 == this.var_3688.name_3637 && ((_loc2_ || _loc4_) && (_loc3_ || _loc5_)))
         {
            this.var_2930 += int((this.var_3688.name_3637.mouseX - var_3398) / this.var_3690);
            this.var_2935 += int((this.var_3688.name_3637.mouseX - var_3398) / this.var_3690);
            if(this.var_2930 < var_3393)
            {
               _loc6_ = this.var_2935 - this.var_2930;
               this.var_2930 = var_3393;
               this.var_2935 = var_3393 + _loc6_;
            }
            if(this.var_2935 > var_3394)
            {
               _loc6_ = this.var_2935 - this.var_2930;
               this.var_2935 = var_3394;
               this.var_2930 = this.var_2935 - _loc6_;
            }
            _loc6_ = this.var_2935 - this.var_2930;
            if(this.var_2930 > this.var_3687)
            {
               this.var_2930 = this.var_3687;
               this.var_2935 = this.var_2930 + _loc6_;
            }
            if(this.var_2935 < this.var_3687)
            {
               this.var_2935 = this.var_3687;
               this.var_2930 = this.var_2935 - _loc6_;
            }
         }
         this.method_3293();
      }
      
      private function method_3293() : void
      {
         var _loc1_:int = this.var_2935 - this.var_2930;
         this.var_3688.minRang = this.var_2930;
         this.var_3688.maxRang = this.var_2935;
         this.var_3688.width = var_3395 + this.var_3690 * _loc1_;
         this.var_3688.x = int(this.var_3690 * (this.var_2930 - var_3393));
      }
      
      public function get maxRangRange() : int
      {
         return this.var_3689;
      }
      
      public function set maxRangRange(param1:int) : void
      {
         this.var_3689 = param1;
      }
   }
}
