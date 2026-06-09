module.exports = {
    platform: 'github',
    username: 'onecx-renovate[bot]',
    onboarding: false,
    autodiscover: true,
    autodiscoverNamespaces: ['onecx'],
    autodiscoverFilter: [
        "onecx/*-bff",
        "onecx/*-svc",
        "onecx/*-operator",
        "onecx/*-legacy",
        "onecx/onecx-test-oidc",
        "onecx/onecx-db-check",
        "onecx/test-renovate",
    ],
    enabledManagers: ['maven','dockerfile','helmv3'],
}
