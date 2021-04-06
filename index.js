const ffmpeg = require("fluent-ffmpeg");
const ffmpegInstaller = require("@ffmpeg-installer/ffmpeg");

ffmpeg.setFfmpegPath(ffmpegInstaller.path);

ffmpeg("41.mp4")
  .addOptions([
    "-c:a aac",
    "-strict experimental",
    "-c:v libx264",
    "-s 320x180",
    "-f hls",
    "-hls_list_size 1000000000",
    "-hls_time 10",
  ])
  .on("start", () => console.log("starting first"))
  .output("41/180_out.m3u8")
  .on("end", () => {
    console.log("ended");
  })
  .run();

ffmpeg("41.mp4")
  .addOptions([
    "-c:a aac",
    "-strict experimental",
    "-c:v libx264",
    "-s 480x270",
    "-f hls",
    "-hls_list_size 1000000000",
    "-hls_time 10",
  ])
  .output("41/270_out.m3u8")
  .on("end", () => {
    console.log("ended");
  })
  .run();

ffmpeg("41.mp4")
  .addOptions([
    "-c:a aac",
    "-strict experimental",
    "-c:v libx264",
    "-s 640x360",
    "-f hls",
    "-hls_list_size 1000000000",
    "-hls_time 10",
  ])
  .output("41/360_out.m3u8")
  .on("end", () => {
    console.log("ended");
  })
  .run();

ffmpeg("41.mp4", { timeout: 432000 })
  .addOptions([
    "-c:a aac",
    "-strict experimental",
    "-c:v libx264",
    "-s 960x540",
    "-f hls",
    "-hls_list_size 1000000000",
    "-hls_time 10",
  ])
  .output("41/540_out.m3u8")
  .on("end", () => {
    console.log("ended");
  })
  .run();

ffmpeg("41.mp4", { timeout: 432000 })
  .addOptions([
    "-c:a aac",
    "-strict experimental",
    "-c:v libx264",
    "-s 1280x720",
    "-f hls",
    "-hls_list_size 1000000000",
    "-hls_time 10",
  ])
  .output("41/720_out.m3u8")
  .on("end", () => {
    console.log("ended");
  })
  .run();
