using SDL2;

namespace Strawberry
{
	static public class Draw
	{
		static public Point Camera => Game.Scene != null ? Game.Scene.Camera.Round() : Point.Zero;

		static public void Rect(int x, int y, int w, int h, Color color)
		{
			SDL.SetRenderDrawColor(Game.Renderer, color.R, color.G, color.B, color.A);
			SDL.RenderFillRect(Game.Renderer, &SDL.Rect((int32)(x - Camera.X), (int32)(y - Camera.Y), (int32)w, (int32)h));
		}

		static public void Rect(Rect rect, Color color)
		{
			Rect(rect.X, rect.Y, rect.Width, rect.Height, color);
		}

		static public void HollowRect(int x, int y, int w, int h, Color color)
		{
			SDL.SetRenderDrawColor(Game.Renderer, color.R, color.G, color.B, color.A);
			SDL.RenderDrawRect(Game.Renderer, &SDL.Rect((int32)(x - Camera.X), (int32)(y - Camera.Y), (int32)w, (int32)h));
		}

		static public void HollowRect(Rect rect, Color color)
		{
			HollowRect(rect.X, rect.Y, rect.Width, rect.Height, color);
		}

		static public void Line(Point from, Point to, Color color)
		{
			let fromn = (Point)(from - Camera);
			let ton = (Point)(to - Camera);

			SDL.SetRenderDrawColor(Game.Renderer, color.R, color.G, color.B, color.A);
			SDL.RenderDrawLine(Game.Renderer, (int32)fromn.X, (int32)fromn.Y, (int32)ton.X, (int32)ton.Y);
		}
	}
}
