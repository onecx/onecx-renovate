module.exports = {
    platform: 'github',
    username: 'onecx-renovate[bot]',
    onboarding: false,
    autodiscover: true,
    autodiscoverNamespaces: ['onecx'],
    autodiscoverFilter: [
        "onecx/docker-*",
    ],
    enabledManagers: ['dockerfile'],
}
