import clsx from "clsx";

export const LibraryMenuControlButtons = ({
  style,
  children,
  className,
}: {
  style: React.CSSProperties;
  children?: React.ReactNode;
  className?: string;
}) => {
  return (
    <div
      className={clsx("library-menu-control-buttons", className)}
      style={style}
    >
      {children}
    </div>
  );
};
