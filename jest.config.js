const reporters = process.env.CI
  ? [
      'default',
      [
        'jest-junit',
        {
          outputDirectory: 'test-results',
          outputName: 'junit.xml',
        },
      ],
    ]
  : ['default'];

module.exports = {
  preset: 'react-native',
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json', 'node'],
  transformIgnorePatterns: [
    'node_modules/(?!(react-native|@react-native|@react-navigation|react-native-gesture-handler|react-native-reanimated|react-native-screens|react-native-safe-area-context|react-native-iphone-x-helper|@react-native-community|lottie-react-native)/)',
  ],
  setupFilesAfterEnv: ['<rootDir>/jest.setup.js'],
  reporters,
};