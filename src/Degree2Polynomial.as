package  
{
	/**
	 * ...
	 * @author Kurinkitos
	 */
	public class Degree2Polynomial 
	{
		private var _a:Number;
		private var _b:Number;
		private var _c:Number;
		public function Degree2Polynomial(a:Number = 1, b:Number = 1, c:Number = 1) {
			_a = a;
			_b = b;
			_c = c;
		}
		public function setCoefficients(a:Number, b:Number, c:Number):void {
			_a = a;
			_b = b;
			_c = c;
		}
		public function evaluate(x:Number):Number {
			var ans:Number = (_a*x + _b) * x + _c
			return ans;
		}
		public function toString():String {
			var temp:String = _a.toString();
			temp += "x^2 + ";
			temp += _b.toString();
			temp += "x + ";
			temp += _c.toString();
			return temp;
		}
		public function solve():String {
			if (_a == 0 && _b == 0) {
				return "x can be anything";
			}
			if (_a == 0) {
				return String("x = " + _c/_b);
			}
			if ((_b * _b) - 4 * (_a * _c) < 0) {
				return "No real roots";
			}
			
			var x1:Number = this.getFirstRoot();
			var x2:Number = this.getSecondRoot();
			var answer:String = "x1 = " + x1 + " x2 = " + x2;
			return answer;
		}
		private function getFirstRoot():Number {
			var x:Number = ( -_b + (Math.sqrt((_b * _b) - 4 * (_a * _c)))) / (2 * _a);				
			return x;
		}
		private function getSecondRoot():Number {
			var x:Number = ( -_b - (Math.sqrt((_b * _b) - 4 * (_a * _c)))) / (2 * _a);
			return x;
		}
	}

}