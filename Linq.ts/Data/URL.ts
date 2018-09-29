﻿/// <reference path="./sprintf.ts" />

namespace TsLinq {

    export class URL {

        /**
         * 域名
        */
        public origin: string;
        /**
         * 页面的路径
        */
        public path: string;
        /**
         * URL查询参数
        */
        public query: NamedValue<string>[];
        /**
         * 不带拓展名的文件名称
        */
        public fileName: string;
        public hash: string;
        public protocol: string;

        public constructor(url: string) {
            // http://localhost/router.html#http://localhost/b.html
            var token = Strings.GetTagValue(url, "://");

            this.protocol = token.name; token = Strings.GetTagValue(token.value, "/");
            this.origin = token.name; token = Strings.GetTagValue(token.value, "?");
            this.path = token.name;
            this.fileName = Strings.Empty(this.path) ? "" : URL.basename(this.path);
            this.hash = From(url.split("#")).Last;

            if (url.indexOf("#") < 0) {
                this.hash = "";
            }

            var args: object = URL.UrlQuery(token.value);

            this.query = new Dictionary<string>(args)
                .Select(m => new NamedValue<string>(m.key, m.value))
                .ToArray();
        }

        public static UrlQuery(args: string): object {
            if (args) {
                return DataExtensions.parseQueryString(args, false);
            } else {
                return {};
            }
        }

        public static basename(fileName: string): string {
            var nameTokens: string[] = From(fileName.split("/")).Last.split(".");
            var name: string = From(nameTokens)
                .Take(nameTokens.length - 1)
                .JoinBy(".");

            return name;
        }

        public static WindowLocation(): URL {
            return new URL(window.location.href);
        }

        /**
         * 对bytes数值进行格式自动优化显示
         * 
         * @param bytes 
         * 
         * @return 经过自动格式优化过后的大小显示字符串
        */
        public static Lanudry(bytes: number): string {
            var symbols = ["B", "KB", "MB", "GB", "TB"];
            var exp = Math.floor(Math.log(bytes) / Math.log(1000));
            var symbol: string = symbols[exp];
            var val = (bytes / Math.pow(1000, Math.floor(exp)));

            return sprintf(`%.2f ${symbol}`, val);
        }

        public toString(): string {
            var query = From(this.query)
                .Select(q => `${q.name}=${encodeURIComponent(q.value)}`)
                .JoinBy("&");
            var url = `${this.protocol}://${this.origin}/${this.path}`;

            if (query) {
                url = url + "?" + query;
            }
            if (this.hash) {
                url = url + "#" + this.hash;
            }

            return url;
        }
    }
}