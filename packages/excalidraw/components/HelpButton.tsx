import { t } from "../i18n";

import { HelpIcon } from "./icons";

type HelpButtonProps = {
  name?: string;
  id?: string;
  onClick?(): void;
};

export const HelpButton = (props: HelpButtonProps) => (
  <button
    className="help-icon"
    onClick={props.onClick}
    type="button"
          title={`${t("helpDialog.shortcuts")} — ?`}
      aria-label={t("helpDialog.shortcuts")}
  >
    {HelpIcon}
  </button>
);
