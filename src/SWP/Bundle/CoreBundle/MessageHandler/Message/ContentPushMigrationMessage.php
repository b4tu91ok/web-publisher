<?php

declare(strict_types=1);

/*
 * This file is part of the Superdesk Web Publisher Core Bundle.
 *
 * Copyright 2020 Sourcefabric z.ú. and contributors.
 *
 * For the full copyright and license information, please see the
 * AUTHORS and LICENSE files distributed with this source code.
 *
 * @copyright 2020 Sourcefabric z.ú
 * @license http://www.superdesk.org/license
 */

namespace SWP\Bundle\CoreBundle\MessageHandler\Message;

class ContentPushMigrationMessage implements MessageInterface
{
    /** @var int */
    private $tenantId;

    /** @var int */
    private $packageId;

    public function __construct(int $tenantId, int $packageId)
    {
        $this->tenantId = $tenantId;
        $this->packageId = $packageId;
    }

    public function getTenantId(): int
    {
        return $this->tenantId;
    }

    public function getPackageId(): int
    {
        return $this->packageId;
    }

    public function toArray(): array
    {
        return [
            'tenantId' => $this->tenantId,
            'packageId' => $this->packageId,
        ];
    }
}