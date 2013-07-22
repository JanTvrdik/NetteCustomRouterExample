<?php
namespace App;

use Nette;
use Nette\Application as App;
use Nette\Http;


class CustomRouter extends Nette\Object implements Nette\Application\IRouter
{
	/** @var SlugManager */
	private $slugManager;

	/** @var array (slugs.type => presenter name) */
	private $presenters = array(
		'user' => 'Users',
		'group' => 'Groups',
		'event' => 'Events',
	);

	public function __construct(SlugManager $slugManager)
	{
		$this->slugManager = $slugManager;
	}

	/**
	 * Maps HTTP request to a Request object.
	 *
	 * @return App\Request|NULL
	 */
	public function match(Http\IRequest $httpRequest)
	{
		$slug = $httpRequest->getUrl()->getPathInfo();
		$row = $this->slugManager->getBySlug($slug);
		if (!$row || !isset($this->presenters[$row->type])) return NULL;

		$presenter = $this->presenters[$row->type];
		$params = $httpRequest->getQuery();
		$params['action'] = 'default';
		$params['slug'] = $slug;

		return new App\Request(
			$presenter,
			$httpRequest->getMethod(),
			$params,
			$httpRequest->getPost(),
			$httpRequest->getFiles(),
			array(App\Request::SECURED => $httpRequest->isSecured())
		);
	}

	/**
	 * Constructs absolute URL from Request object.
	 *
	 * @return string|NULL
	 */
	public function constructUrl(App\Request $appRequest, Http\Url $refUrl)
	{
		if (!in_array($appRequest->presenterName, $this->presenters)) return NULL;

		$params = $appRequest->getParameters();
		$slug = isset($params['slug']) ? $params['slug'] : NULL;
		$action = isset($params['action']) ? $params['action'] : NULL;
		if ($action !== 'default' || !is_string($slug)) return NULL;
		unset($params['action'], $params['slug']); // we don't want to have 'action' and 'slug' in query parameters

		$url = new Http\Url($refUrl->getBaseUrl() . $slug);
		$url->setQuery($params);
		return $url->getAbsoluteUrl();
	}
}
