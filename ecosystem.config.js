module.exports = {
  apps : [{
    name: "Tradeora",
    script: "node index.js",
    env: {
      NODE_ENV: "development",
    },
    env_production: {
      NODE_ENV: "production",
    }
  }]
}
