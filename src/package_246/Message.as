package package_246
{
   import controls.Label;
   
   internal class Message
   {
      
      private static const const_2100:int = 500;
      
      private static const const_2018:int = 700;
      
      private static const LIFE_TIME1:int = 2000;
      
      private static const LIFE_TIME2:int = 10000;
      
      private static const ALPHA:Number = 0.6;
       
      
      private const const_1895:int = 18;
      
      private var var_2719:Vector.<name_2789>;
      
      private var var_2718:Vector.<name_2789>;
      
      public var name_2076:Boolean;
      
      private var label:Label;
      
      private var var_2426:Vector.<name_2789>;
      
      private var var_2717:int;
      
      public function Message()
      {
         this.label = new Label();
         super();
         this.var_2719 = Vector.<name_2789>([new name_2790(this,500,0,1),new name_2791(2000),new name_2790(this,700,1,0.6),new name_2791(10000),new name_2790(this,700,0.6,0)]);
         this.var_2718 = Vector.<name_2789>([new name_2790(this,700,1,0.6),new name_2791(10000),new name_2790(this,700,0.6,0)]);
         this.label.size = 18;
         this.label.bold = true;
      }
      
      public function init() : void
      {
         this.name_2076 = false;
         this.var_2717 = 0;
         this.var_2426 = this.var_2719;
         var _loc1_:name_2789 = this.var_2426[0];
         _loc1_.init();
      }
      
      public function name_2077(param1:int) : void
      {
         this.name_2076 = false;
         this.var_2717 = 0;
         this.var_2426 = this.var_2718;
         var _loc2_:name_2789 = this.var_2426[1];
         _loc2_.name_2792(param1);
         var _loc3_:name_2789 = this.var_2426[0];
         _loc3_.init();
      }
      
      public function update(param1:int) : void
      {
         var _loc2_:name_2789 = null;
         var _loc3_:name_2789 = null;
         if(!this.name_2076)
         {
            _loc2_ = this.var_2426[this.var_2717];
            if(!_loc2_.update(param1))
            {
               if(++this.var_2717 == this.var_2426.length)
               {
                  this.name_2076 = true;
               }
               else
               {
                  _loc3_ = this.var_2426[this.var_2717];
                  _loc3_.init();
               }
            }
         }
      }
      
      public function name_1068(param1:Number) : void
      {
         this.label.alpha = param1;
      }
      
      public function name_2075() : Label
      {
         return this.label;
      }
   }
}
