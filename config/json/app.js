const Koa = require('koa');
const app = new Koa();
const fs = require('fs');
app.use(async (ctx) => {
  ctx.body = getImagePath();
});

function getImagePath() {
  var craft_resources = JSON.parse(fs.readFileSync('./craft_resources.json'))[
    'root'
  ]['resource'];
  console.log(craft_resources.length);
  var imagePath = '';
  for(let i = 0;i<craft_resources.length;i++){
    if(craft_resources[i]['-file'] !== undefined){
      imagePath += `   - ${craft_resources[i]['-file']}.png\n`
    }
  }
  return imagePath;
}

app.listen(3000);
