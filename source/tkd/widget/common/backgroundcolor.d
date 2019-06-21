/**
 * BackgroundColor module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.common.backgroundcolor;

/**
 * These are common commands that apply to all widgets that have them injected.
 */
mixin template BackgroundColor()
{
	import std.string;

	/**
	 * Set the background color of the widget.
	 *
	 * Params:
	 *     color = The name of the color, e.g. 'black' or a hex value, e.g. '#000000'.
	 *
	 * Returns:
	 *     This widget to aid method chaining.
	 *
	 * See_Also:
	 *     $(LINK2 ../../element/color.html, tkd.element.color) for standard defined colors.
	 */
	public auto setBackgroundColor(this T)(string color)
	{
		this._tk.eval("%s configure -background %s", this.id, color);

		return cast(T) this;
	}

	public string getBackgroundColor()
	{
		this._tk.eval(format("%s cget -background", this.id));
		if (this._tk.getResult!(string).empty())
		{
			this._tk.eval(format("winfo background %s", this.id));
		}
		return this._tk.getResult!(string);
	}
}
