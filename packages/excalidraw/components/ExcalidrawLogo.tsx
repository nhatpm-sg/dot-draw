import "./ExcalidrawLogo.scss";



const LogoText = () => (
  <div 
    className="ExcalidrawLogo-text"
    style={{ 
      color: '#000000',
      fontWeight: 'bold',
      fontSize: 'inherit',
      fontFamily: 'inherit'
    }}
  >
    Dottrips Draw
  </div>
);

type LogoSize = "xs" | "small" | "normal" | "large" | "custom";

interface LogoProps {
  size?: LogoSize;
  withText?: boolean;
  style?: React.CSSProperties;
  /**
   * If true, the logo will not be wrapped in a Link component.
   * The link prop will be ignored as well.
   * It will merely be a plain div.
   */
  isNotLink?: boolean;
}

export const ExcalidrawLogo = ({
  style,
  size = "small",
  withText,
}: LogoProps) => {
  return (
    <div className={`ExcalidrawLogo is-${size}`} style={style}>
      {withText && <LogoText />}
    </div>
  );
};
