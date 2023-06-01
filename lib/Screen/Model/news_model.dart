class NewsModel {
  List<Article>? article = [];

  NewsModel({this.article});

  factory NewsModel.fromJson(Map m1) {
    List l1 = m1['articles'];
    return NewsModel(article: l1.map((e) => Article.fromJson(e)).toList());
  }
}

class Article {
  String? author, title, description, url, urlToImage, publishedAt, content;
  Source? source;

  Article(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,this.source});

  factory Article.fromJson(Map m1) {
    return Article(
        author: m1['author'],
        description: m1['description'],
        title: m1['title'],
        url: m1['url'],
        content: m1['content'],
        publishedAt: m1['publishedAt'],
        urlToImage: m1['urlToImage'],
        source: Source.fromJson(m1['source']));
  }
}

class Source
{
  String? name;

  Source({this.name});
  
  factory Source.fromJson(Map m1)
  {
    return Source(name: m1['name']);
  }
}

