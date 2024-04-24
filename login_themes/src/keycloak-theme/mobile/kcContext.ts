import { getKcContext } from "keycloakify/login";

export type KcContext = NonNullable<
  ReturnType<typeof getKcContext>["kcContext"]
>;

export const { kcContext } = getKcContext({});
